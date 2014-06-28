Towards a Gravity free Distribution
===================================

The Quest
---------

Build a free/libre open source software distribution that can run Android
Applications, both free and non-free.

It's a distribution, not a plain rom. The out-of-the-box experience includes
for example a wallet (bitcoin), a video player (vlc), the firefox browser and
some other usefull apps. The aim is to provide a usefull rom that just works.

Status Quo
----------

The base distribution has been forked from omnirom. Most projects are still
pulled directly from omnirom.

Working:
- Emulator
- Google Nexus with
  - Phone hw
- Many apps (pulled from f-droid and elsewhere)
- Firefox with preinstalled plugins and DuckDuckGo

Wanted projects
---------------

Maps

The OSMAnd~ is the best we can get at the moment, but it's still quite lacking
compared to google maps. This should be fixed.

Torrent downloader

Either a stand alone torrent downloader or a good combo with owncloud.

Search

Google has destroyed the QuickSearchBox (Google only? W00T LOL). There is
currently no good open source device-wide search. Fix that!

Calculator

A calculator that deserves the name. S.th. that can compete with e.g.
RealCalc. It doesn't have to look retro, but it should provide real calculator
functionality.

P2P web of trust

Multiple papers indicate that a web of trust would be possible if you meet
~5 other users (good friends) and sign their keys. This means that good
crypto could be painless and safe. Integration with OpenPGP Keychain would
be prefered.

PrintService implementation

Currenty print service implementations are closed source. Add an AirPrint
plugin and perhaps some other discovery plugins.

Hint: There is an unmantained JfCupsPrintservice. I buildable version is
      available at https://github.com/rtreffer/JfCupsPrintService/
      Feel free to take over!

Android sync

Enable PC / Mac users to pull/push data from/to android. E.g. with a remote
content provider tool and file access tool over wifi... Bonus points for
integration with local PIM sinks.

Upstream
--------

This distribution uses various sources as upstream. Especially:
- cyanogenmod (https://github.com/CyanogenMod/ - e.g. for Apollo)
- omnirom (https://github.com/omnirom/ - most of the base rom)
- µg/mar-v-in (https://github.com/microg/ - replacement for google services)

Under investigation
- replicant (https://gitorious.org/replicant/ - gnex ril)

Watched apps / projects
-----------------------

These apps and projects are currently under investigation and might at
some point be included (or dropped from this list)

- Jitsi android (sip + voip, encrypted, cross device/platform)

Contributing / Helping
----------------------

Chances are your time might be used better if you help some of the projects we
use, e.g.
- openstreetmap.org - the card material, you can help to improve it!
- opencellids.org - data for location providers, just run an app to help!
- f-droid - they have a loooong backlog of open source, help adding it!
- help replicant.us to finish the RIL implementation
- help porting to new devices (either gfreed, omnirom or cyanogenmod)

If you want to help gfreed:
- Make sure your contributions push open source software
- Make sure the user experience is good
- Features must be
  - Usefull to all users (or most users at least)
  - Unique within the ROM

The last point needs some explenation: We regard everything that's running
in the ROM as a feature, either apps or core modifications. We'll add at
most one app per task. E.g. we'll ship connect bot but not terminal, as
connect bot can start "local" sessions, duplicating the functionality of
terminal.
We'll pick one (and only one) chat app. The objective is the same as on a
ubuntu desktop: We want to provice a good out-of-the-box experience. Multiple
chat applications would harm usability or the feature set. If you need a
different one you're free to install a new one and uninstall an old onw.

Regarding blobs
---------------

A blob-free OS is better than an OS full of blobs. A working OS is better than
a blob-free OS.
We dislike blobs. A lot. They are shitty, especially if they run alongside
our code (firmware is better as it's usually running on a different chip).
That said a non-operational phone is not an option. We have high hopes that
replicant will improve over time.
