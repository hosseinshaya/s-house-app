format:
	dart format --fix -l 120 .

clean-get: clean get

get:
	flutter pub get

clean:
	flutter clean

app-icons:
	flutter pub run flutter_launcher_icons:main

app-name:
	flutter pub run flutter_app_name

native-splash:
	flutter pub run flutter_native_splash:create --path=native_splash.yaml

# generate dependencies and resources

build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

langs:
	flutter pub run easy_localization:generate --output-dir "lib/common/localization" -f keys -o locale_keys.g.dart

res:
	spider build

dep\:langs: langs

dep\:build-runner: build-runner

dep\:res: res

dep: dep\:res dep\:build-runner dep\:langs

# run app easier

run\:web:
	export CHROME_EXECUTABLE=chromium
	flutter run -d chrome --web-renderer canvaskit 

run\:linux:
	flutter run -d linux

# build release app

build\:web:
	flutter build web --web-renderer canvaskit --release --no-sound-null-safety

build\:android:
	flutter build apk --release

run\:web\:prod:
	python3 -m http.server --directory /app/build/web/ 3000
