Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.4819.1618480756141884270
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=bxBwjjdm;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 61FE120B8001; Thu, 15 Apr 2021 02:59:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 61FE120B8001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618480755;
	bh=0fGR8HOE5knpDJ3p0S8YKEafhm6uKE9cJnflN6mFBj4=;
	h=From:To:Subject:Date:From;
	b=bxBwjjdm51AFiCmWC0bo2WJjhi1R881fBcJS5efTDUdkBRK6INsr44RdArA+/nrh0
	 8tld5PmxS2svlWRxX5IBir2gF+OjjBUqVso5FRg9LBk9fMkkhTVL5Bi3PxD1upougq
	 VSkj8NloIk7vD14s902JwjA+zx+32qYKSIKXuavo=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2 00/14] Documentation updates for 3.3
Date: Thu, 15 Apr 2021 02:58:58 -0700
Message-Id: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

The migration guide for 3.3, plus some missing related changes and a few
cleanups. Let me know if I missed anything.

Changes since v1:
* Incorporated feedback from Quentin, Nico & Robert.
* Removed erroneous mention of ccache host requirement (commit that
  made the corresponding code change was later reverted)
* Added DISTUTILS_SETUP_PATH info as I noticed this was also missing.



The following changes since commit 4f7f451df266a307b34bf145b29291ca85eb882f:

  docs: add a top level page for bitbake documentation (2021-04-09 09:00:53 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib paule/migration-3.3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/migration-3.3

Paul Eggleton (14):
  ref-manual: add METADATA_REVISION and METADATA_BRANCH
  Use variables for minimum host versions and bump Python to 3.6
  ref-manual: update/fix text for SDK_VERSION
  overview-manual: fix git command line
  ref-manual: and SDK_CUSTOM_TEMPLATECONF to glossary
  ref-manual: add REQUIRED_VERSION and adjust PREFERRED_VERSION entry
  ref-manual: add python3targetconfig class and remove python 2
    references
  ref-manual: add passwd-expire to EXTRA_USERS_PARAMS
  ref-manual: add FIT_KERNEL_COMP_ALG*
  ref-manual: fix reference to build-essential
  ref-manual: tweak buildtools section
  ref-manual: add migration section for 3.3 release
  ref-manual: migration guide: add release codenames
  ref-manual: add mention of DISTUTILS_SETUP_PATH

 documentation/brief-yoctoprojectqs/index.rst       |   8 +-
 documentation/dev-manual/start.rst                 |   8 +-
 .../overview-manual/development-environment.rst    |   2 +-
 documentation/poky.yaml                            |   4 +
 documentation/ref-manual/classes.rst               |  67 ++------
 documentation/ref-manual/faq.rst                   |   2 +-
 documentation/ref-manual/migration-1.3.rst         |   6 +-
 documentation/ref-manual/migration-1.4.rst         |   6 +-
 documentation/ref-manual/migration-1.5.rst         |   6 +-
 documentation/ref-manual/migration-1.6.rst         |   6 +-
 documentation/ref-manual/migration-1.7.rst         |   6 +-
 documentation/ref-manual/migration-1.8.rst         |   6 +-
 documentation/ref-manual/migration-2.0.rst         |   6 +-
 documentation/ref-manual/migration-2.1.rst         |   6 +-
 documentation/ref-manual/migration-2.2.rst         |   6 +-
 documentation/ref-manual/migration-2.3.rst         |   6 +-
 documentation/ref-manual/migration-2.4.rst         |   6 +-
 documentation/ref-manual/migration-2.5.rst         |   6 +-
 documentation/ref-manual/migration-2.6.rst         |   8 +-
 documentation/ref-manual/migration-2.7.rst         |   6 +-
 documentation/ref-manual/migration-3.0.rst         |   6 +-
 documentation/ref-manual/migration-3.1.rst         |   6 +-
 documentation/ref-manual/migration-3.2.rst         |   6 +-
 documentation/ref-manual/migration-3.3.rst         | 168 +++++++++++++++++++++
 documentation/ref-manual/migration.rst             |   1 +
 documentation/ref-manual/system-requirements.rst   |  19 ++-
 documentation/ref-manual/variables.rst             |  89 +++++++++--
 27 files changed, 337 insertions(+), 135 deletions(-)
 create mode 100644 documentation/ref-manual/migration-3.3.rst

-- 
1.8.3.1

