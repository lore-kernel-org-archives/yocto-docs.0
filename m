Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.831.1627665540251521095
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 10:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6BD19200006;
	Fri, 30 Jul 2021 17:18:58 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <b8d20a70-120b-c6e9-1064-f0614edcd766@bootlin.com>
Date: Fri, 30 Jul 2021 19:18:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello Richard,

The following changes since commit c834fab46794233864e6bcb587ab75f2bfa1631c:

  ref-manual: Document BUILDHISTORY_PATH_PREFIX_STRIP (2021-07-12
12:24:51 +0200)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next
  https://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/log/?h=master-next

for you to fetch changes up to 34cb466caf872f9284eb81f6a5f31ad606214dee:

  manuals: remove explicit BitBake variable references (2021-07-30
18:22:45 +0200)

----------------------------------------------------------------
Michael Opdenacker (6):
      test-manual: document LTO related reproducibility bug
      quick start manual: update "source oe-init-build-env" output
      dev-manual: fix wrong reference to class
      documentation/README: improve BitBake manual referencing guidelines
      manuals: simplify references to BitBake manual
      manuals: remove explicit BitBake variable references

Richard Purdie (1):
      migration-guides: Add start of 3.4 guide with override migration notes

 documentation/README                              | 15 ++++++++++++---
 documentation/brief-yoctoprojectqs/index.rst      | 14 +++++++++++---
 documentation/dev-manual/common-tasks.rst         | 10 +++++-----
 documentation/migration-guides/index.rst          |  1 +
 documentation/migration-guides/migration-2.4.rst  |  4 ++--
 documentation/migration-guides/migration-3.0.rst  |  2 +-
 documentation/migration-guides/migration-3.4.rst  | 76
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 documentation/overview-manual/concepts.rst        | 12 +++++-------
 documentation/ref-manual/tasks.rst                |  4 ++--
 documentation/ref-manual/variables.rst            | 17 ++++++++---------
 documentation/sdk-manual/extensible.rst           |  2 +-
 documentation/test-manual/reproducible-builds.rst | 11 +++++++++++
 12 files changed, 135 insertions(+), 33 deletions(-)
 create mode 100644 documentation/migration-guides/migration-3.4.rst

Thank you in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

