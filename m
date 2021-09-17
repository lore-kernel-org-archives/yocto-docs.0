Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.1841.1631900698885923325
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Sep 2021 10:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 61C7BFF803;
	Fri, 17 Sep 2021 17:44:55 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: [master] Pull request
Organization: Bootlin
Message-ID: <e161a140-7e45-d18c-a5fc-12131f1a98d8@bootlin.com>
Date: Fri, 17 Sep 2021 19:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

The following changes since commit 68e6782c19e9f88c3cd89b4948d22d216e0165b1:

  dev-manual: update mailing list address (2021-09-17 07:30:04 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs master-next

for you to fetch changes up to 7df7356b8a306d7e77f0aab1f443fd1306c25620:

  dev-manual: update output of "wic list images" (2021-09-17 19:39:24 +0200)

----------------------------------------------------------------
Michael Opdenacker (7):
      manuals: replace Freenode by Libera Chat as IRC host
      manuals: delete unmaintained history sections
      ref-manual: document UPSTREAM_CHECK_COMMITS and
UPSTREAM_VERSION_UNKNOWN
      ref-manual: remove checkpkg task
      ref-manual: improve "devtool check-upgrade-status" details
      ref-manual: improve documentation for RECIPE_NO_UPDATE_REASON
      ref-manual: update "devtool check-upgrade-status" output

Robert P. J. Day (7):
      ref-manual: render options in monospace to show quotes properly
      ref-manual: remove mention of obsolete devtool "--any-recipe" option
      ref-manual: correct typo in "classes" section, "${BPN}/{PV}"
      ref-manual: add potential of parallelism to defn of "Task"
      ref-manual: couple minor tweaks to Chapter 1
      dev-manual: emphasize that new layers live outside of poky
      dev-manual: update output of "wic list images"

Tom Rini (1):
      common-tasks: Add an example of using bbappends to add a file

Vyacheslav Yurkov (1):
      ref-manual: add overlayfs class

 documentation/boilerplate.rst                    |  2 +-
 documentation/bsp-guide/history.rst              | 73
-------------------------------------------------------------------------
 documentation/bsp-guide/index.rst                |  1 -
 documentation/dev-manual/common-tasks.rst        | 80
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 documentation/dev-manual/history.rst             | 67
-------------------------------------------------------------------
 documentation/dev-manual/index.rst               |  1 -
 documentation/kernel-dev/history.rst             | 58
----------------------------------------------------------
 documentation/kernel-dev/index.rst               |  1 -
 documentation/overview-manual/history.rst        | 28
----------------------------
 documentation/overview-manual/index.rst          |  1 -
 documentation/profile-manual/history.rst         | 58
----------------------------------------------------------
 documentation/profile-manual/index.rst           |  1 -
 documentation/ref-manual/classes.rst             | 51
++++++++++++++++++++++++++++++++++++++++++++++++++-
 documentation/ref-manual/devtool-reference.rst   | 73
++++++++++++++++++++++++++++++++++++++++---------------------------------
 documentation/ref-manual/history.rst             | 74
--------------------------------------------------------------------------
 documentation/ref-manual/index.rst               |  1 -
 documentation/ref-manual/resources.rst           | 13 +++++++------
 documentation/ref-manual/system-requirements.rst |  5 +++--
 documentation/ref-manual/tasks.rst               | 31
-------------------------------
 documentation/ref-manual/terms.rst               |  8 +++++++-
 documentation/ref-manual/variables.rst           | 35
+++++++++++++++++++++++++++++++++--
 documentation/sdk-manual/history.rst             | 40
----------------------------------------
 documentation/sdk-manual/index.rst               |  1 -
 documentation/test-manual/history.rst            | 16 ----------------
 documentation/test-manual/index.rst              |  1 -
 documentation/toaster-manual/history.rst         | 46
----------------------------------------------
 documentation/toaster-manual/index.rst           |  1 -
 27 files changed, 213 insertions(+), 554 deletions(-)
 delete mode 100644 documentation/bsp-guide/history.rst
 delete mode 100644 documentation/dev-manual/history.rst
 delete mode 100644 documentation/kernel-dev/history.rst
 delete mode 100644 documentation/overview-manual/history.rst
 delete mode 100644 documentation/profile-manual/history.rst
 delete mode 100644 documentation/ref-manual/history.rst
 delete mode 100644 documentation/sdk-manual/history.rst
 delete mode 100644 documentation/test-manual/history.rst
 delete mode 100644 documentation/toaster-manual/history.rst

Thank you in advance,
Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

