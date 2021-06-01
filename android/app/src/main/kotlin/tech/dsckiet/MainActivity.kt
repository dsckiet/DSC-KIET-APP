package tech.dsckiet

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.app.NotificationManager;
import android.app.NotificationChannel;
import android.net.Uri;
import android.media.AudioAttributes;
import android.content.ContentResolver;


class MainActivity: FlutterActivity() {
  private val CHANNEL = "notification_channel_dsc" //The channel name you set in your main.dart file

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      // Note: this method is invoked on the main thread.
      call, result ->

      if (call.method == "createNotificationChannel"){
        val argData = call.arguments as java.util.HashMap<String, String>
          if (VERSION.SDK_INT > VERSION_CODES.O) {
            // Create the NotificationChannel
            val id = argData["id"]
            val name = argData["name"]
            val descriptionText = argData["description"]
            val sound = "drop"
            val importance = NotificationManager.IMPORTANCE_MAX
            val mChannel = NotificationChannel(id, name, importance)
            mChannel.description = descriptionText

            val soundUri = Uri.parse(ContentResolver.SCHEME_ANDROID_RESOURCE + "://"+ getApplicationContext().getPackageName() + "/raw/drop");
            val att = AudioAttributes.Builder()
            .setUsage(AudioAttributes.USAGE_NOTIFICATION)
            .build();
            mChannel.setSound(soundUri, att)
            mChannel.enableLights(true)
            mChannel.enableVibration(true)
            mChannel.setShowBadge(true)

            // Register the channel with the system; you can't change the importance
            // or other notification behaviors after this
            val notificationManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(mChannel)
        }
      } else {
        result.notImplemented()
      }
    }
  }

  }
