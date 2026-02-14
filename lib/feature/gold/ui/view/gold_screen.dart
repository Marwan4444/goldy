import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/feature/gold/data/repo/gold_repo.dart';
import 'package:goldy/feature/gold/ui/manger/gold_cubit/gold_cubit.dart';
import 'package:goldy/feature/gold/ui/manger/gold_cubit/gold_state.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(GoldPriceRepo()) 
        ..fetchGoldPrice(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          title: const Text('سعر الذهب'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => context.read<GoldCubit>().fetchGoldPrice(),
            ),
          ],
        ),
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
                        if (state is GoldLoaded) {
              final gold = state.gold;
              return _buildContent(gold);
            }
          else  if (state is GoldLoading) {
              return const Center(child: CircularProgressIndicator());
            }

          else  if (state is GoldError) {
              return _buildError(context, state.message);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildContent(gold) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12, offset: Offset(0, 4))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.workspace_premium, size: 60, color: Color(0xFFB8860B)),
            const SizedBox(height: 16),
            Text(
              '\$${gold.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFFB8860B)),
            ),
            const SizedBox(height: 8),
            Text(
              gold.symbol,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Text(
              'آخر تحديث: ${_formatTime(gold.updatedAt)}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 50, color: Colors.red),
          const SizedBox(height: 12),
          Text(message, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.read<GoldCubit>().fetchGoldPrice(),
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final diff = DateTime.now().difference(time);

    if (diff.inSeconds < 60) return 'منذ ${diff.inSeconds} ثانية';
    if (diff.inMinutes < 60) return 'منذ ${diff.inMinutes} دقيقة';
    if (diff.inHours < 24) return 'منذ ${diff.inHours} ساعة';
    return '${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }
}
