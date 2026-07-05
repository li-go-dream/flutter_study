import 'package:flutter/material.dart';

class ScrollLoad<T> extends StatefulWidget {
  final List<dynamic> list;
  final VoidCallback loadFn;
  final bool hasMore;
  final bool loading;
  final bool autoLoad;
  final Widget Function(T item) renderItem;

  const ScrollLoad({
    super.key,
    required this.list,
    required this.loadFn,
    this.hasMore = true,
    this.loading = false,
    this.autoLoad = false,
    required this.renderItem,
  });

  @override
  State<ScrollLoad> createState() => _ScrollLoadState();
}

class _ScrollLoadState extends State<ScrollLoad> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.autoLoad) widget.loadFn();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.loading || !widget.hasMore) return;

    // 当滚动到距离底部 200 像素时触发加载
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.position.pixels;
    if (maxScroll - currentScroll <= 200) {
      widget.loadFn();
    }
  }

  @override
  Widget build(BuildContext context) {
    final list = widget.list;
    final loading = widget.loading;
    final hasMore = widget.hasMore;
    final renderItem = widget.renderItem;
    return ListView.builder(
      controller: _controller,
      itemCount: list.length + ((loading || hasMore) ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == list.length) {
          return loading ? Text('加载中') : Text(hasMore ? '加载完成' : '');
        }
        return renderItem(list[index]);
      },
    );
  }
}



// // ---------- 文章列表组件 ----------
// class ArticleList extends StatefulWidget {
//   const ArticleList({super.key});

//   @override
//   State<ArticleList> createState() => _ArticleListState();
// }

// class _ArticleListState extends State<ArticleList> {
//   // 数据源
//   List<Article> _articles = [];
//   // 滚动控制器
//   final ScrollController _scrollController = ScrollController();

//   // 加载状态
//   bool _isLoading = false;
//   bool _hasMoreData = true; // 是否还有更多数据

//   // 分页参数
//   int _currentPage = 1;
//   static const int _pageSize = 20;

//   @override
//   void initState() {
//     super.initState();
//     // 首次加载数据
//     _loadMoreData();
//     // 监听滚动事件
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   // 滚动监听函数
//   void _onScroll() {
//     if (_isLoading || !_hasMoreData) return;

//     // 当滚动到距离底部 200 像素时触发加载
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.position.pixels;
//     if (maxScroll - currentScroll <= 200) {
//       _loadMoreData();
//     }
//   }

//   // 模拟网络请求加载数据
//   Future<void> _loadMoreData() async {
//     if (_isLoading || !_hasMoreData) return;

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       // 模拟网络请求（替换为真实的 API 请求）
//       await Future.delayed(const Duration(seconds: 1));

//       // 模拟返回数据（第 1 页 20 条，第 2 页 10 条，之后为空）
//       final List<Article> newArticles = _fetchArticles(_currentPage, _pageSize);

//       setState(() {
//         if (newArticles.isEmpty) {
//           _hasMoreData = false;
//         } else {
//           _articles.addAll(newArticles);
//           _currentPage++;
//         }
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       // 处理错误（可显示 SnackBar）
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('加载失败: $e')),
//       );
//     }
//   }

//   // 模拟数据生成
//   List<Article> _fetchArticles(int page, int pageSize) {
//     // 模拟总共只有 3 页数据
//     if (page > 3) return [];

//     final int start = (page - 1) * pageSize;
//     final int end = start + pageSize;
//     // 生成一些内容长度不同的文章，以便展示高度不固定
//     return List.generate(
//       pageSize,
//       (i) => Article(
//         title: '文章 ${start + i + 1}',
//         content: '这是第 ${start + i + 1} 篇文章的内容。' * (1 + (i % 5)), // 长度不同
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       controller: _scrollController,
//       itemCount: _articles.length + (_hasMoreData ? 1 : 0), // 多一个用于加载指示器
//       itemBuilder: (context, index) {
//         // 如果是最后一个且还在加载中，显示加载指示器
//         if (index == _articles.length && _hasMoreData) {
//           return const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//         // 正常显示文章项
//         final article = _articles[index];
//         return _buildArticleItem(article);
//       },
//     );
//   }

//   Widget _buildArticleItem(Article article) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               article.title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               article.content,
//               style: const TextStyle(fontSize: 14),
//               softWrap: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }