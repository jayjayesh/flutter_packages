part of flutter_auth_pkg;

class SplashPageAuthPkg extends ConsumerStatefulWidget {
 
  const SplashPageAuthPkg({
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPageAuthPkg> {
  final splashPageDuration = const Duration(seconds: 2);

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      initialize();
    });
  }

  Future<void> initialize() async {
    await ref.read(authViewModelProvider.notifier).initSharedPreferences();
    await ref.read(authViewModelProvider.notifier).getData();
    final currentUser = ref.watch(currentUserNotifierProvider);
    if (currentUser != null) {
      flutterAuthPkgController.currentUser = currentUser;
      Get.offAllNamed('/myHomePage');
    } else {
      await Future.delayed(splashPageDuration);
      Get.offAllNamed('/loginPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref
        .watch(authViewModelProvider.select((val) => val?.isLoading == true));

    ///
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Center(
            child: Text(
              'SPLASH PAGE',
            ),
          ),
          if (isLoading) const Loader()
        ],
      ),
    );
  }
}
