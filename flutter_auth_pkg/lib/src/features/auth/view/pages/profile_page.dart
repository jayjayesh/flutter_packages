part of flutter_auth_pkg;

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 20),
            Text(
              currentUser?.name ?? '',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              currentUser?.email ?? '',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.blue),
                title: Text(
                  '+1 123 456 7890',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(Icons.home, color: Colors.blue),
                title: Text(
                  '123 Main Street, Anytown, USA',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue.shade900,
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                onTapLogout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  //

  void onTapLogout() {
    ref.read(authViewModelProvider.notifier).logout();
    flutterAuthPkgController.currentUser = null;
    Get.offAllNamed('/loginPage');
  }
}
