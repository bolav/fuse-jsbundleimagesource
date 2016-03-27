Component to use bundled images by filename in Fuse from JavaScript.

Now you can write something like:

	<Each Items="{files}">
		<Image>
			<JSBundleImageSource File="{}" />
		</Image>
	</Each>

From a structure like this:

    var files = ['Assets/Oslo.jpg','Assets/Paris.jpg'];

Just add `JSBundleImageSource.uno` to your project, or reference it from your unoproj file like this:

```
"Projects": [
    "../fuse-jsbundleimagesource/include.unoproj"
  ],
```