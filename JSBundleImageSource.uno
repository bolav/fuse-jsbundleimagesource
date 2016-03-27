using Uno;
using Uno.Collections;
using Fuse.Resources;
using Uno.IO;
public class JSBundleImageSource : ImageSource
{
	string _file;
	public string File { 
		get { return _file; }
		set {
			_file = value;
			fis = null;
			foreach(var bf in Uno.IO.Bundle.AllFiles)
			{
				if(bf.SourcePath == _file)
				{
					fis = new FileImageSource(bf);
					return;
				}
			}
			fis = new FileImageSource();
		}
	}
	FileImageSource fis;

	public override float2 Size { get { return fis.Size; } }
	public override int2 PixelSize { get { return fis.PixelSize; } }
	public override ImageSourceState State { get { return fis.State; } }
	public override texture2D GetTexture() {
		return fis.GetTexture();
	}
	public override void Reload() {
		fis.Reload();
	} 
	
	//We can't use just `Density` here: https://stackoverflow.com/questions/82437/why-is-it-impossible-to-override-a-getter-only-property-and-add-a-setter
	public override float SizeDensity { get { return fis.SizeDensity; } }

}
