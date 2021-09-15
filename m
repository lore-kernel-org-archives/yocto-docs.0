Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.416.1631728728095166292
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 10:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 50CFE240002;
	Wed, 15 Sep 2021 17:58:46 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v3 0/5] Complete upstream version check documentation
Date: Wed, 15 Sep 2021 19:58:37 +0200
Message-Id: <20210915175842.2998541-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org>
References: <16A4FF8E231E8D2E.4682@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This V3 add documentation for the UPSTREAM_CHECK_COMMITS and
UPSTREAM_VERSION_UNKNOWN variables, and takes their usage into account
in the explanations.

There is a little bit of extra text to review if you're interested.

This addresses https://bugzilla.yoctoproject.org/show_bug.cgi?id=14431

Thanks in advance.

Michael Opdenacker (5):
  ref-manual: document UPSTREAM_CHECK_COMMITS and
    UPSTREAM_VERSION_UNKNOWN
  ref-manual: remove checkpkg task
  ref-manual: improve "devtool check-upgrade-status" details
  ref-manual: improve documentation for RECIPE_NO_UPDATE_REASON
  ref-manual: update "devtool check-upgrade-status" output

 .../ref-manual/devtool-reference.rst          | 57 ++++++++++---------
 documentation/ref-manual/tasks.rst            | 31 ----------
 documentation/ref-manual/variables.rst        | 35 +++++++++++-
 3 files changed, 63 insertions(+), 60 deletions(-)

-- 
2.25.1

