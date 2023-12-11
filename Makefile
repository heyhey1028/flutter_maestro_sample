clean_project:
	flutter pub get
	cd ios && rm -rf Pods
	cd ios && rm -rf Podfile.lock
	cd ios && arch -x86_64 pod install --repo-update
	flutter clean
	flutter pub get	