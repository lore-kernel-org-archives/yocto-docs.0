Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.4356.1627405919402346156
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jul 2021 10:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id A71A3240004;
	Tue, 27 Jul 2021 17:11:57 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v2 0/3] Improve/simplify references to the BitBake manual
Date: Tue, 27 Jul 2021 19:11:44 +0200
Message-Id: <20210727171147.132288-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1695B21F5A0B37B5.3345@lists.yoctoproject.org>
References: <1695B21F5A0B37B5.3345@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new version:
- Updates the guidelines about refering to variable descriptions
  in the BitBake manual
- Explains the simplifications made to the references to the
  BitBake manual
- Add a new commit to replace explicit references to term
  descriptions in the BitBake manual by generic term references.
  Such descriptions are taken first from the Yocto Project Variable
  Glossary, or otherwise from the BitBake manual.

*** BLURB HERE ***

Michael Opdenacker (3):
  documentation/README: improve BitBake manual referencing guidelines
  manuals: simplify references to BitBake manual
  manuals: remove explicit BitBake variable references

 documentation/README                            | 15 ++++++++++++---
 documentation/brief-yoctoprojectqs/index.rst    |  4 ++--
 documentation/dev-manual/common-tasks.rst       |  8 ++++----
 .../migration-guides/migration-2.4.rst          |  4 ++--
 .../migration-guides/migration-3.0.rst          |  2 +-
 documentation/overview-manual/concepts.rst      | 12 +++++-------
 documentation/ref-manual/tasks.rst              |  4 ++--
 documentation/ref-manual/variables.rst          | 17 ++++++++---------
 documentation/sdk-manual/extensible.rst         |  2 +-
 9 files changed, 37 insertions(+), 31 deletions(-)

-- 
2.25.1

