Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.1067.1616177626541195906
 for <docs@lists.yoctoproject.org>;
 Fri, 19 Mar 2021 11:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from localhost (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AE89E60008
	for <docs@lists.yoctoproject.org>; Fri, 19 Mar 2021 18:13:44 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/1] Update documentation URL
Date: Fri, 19 Mar 2021 19:13:20 +0100
Message-Id: <20210319181321.45758-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch looks trivial, but the change to
documentation/brief-yoctoprojectqs/index.rst
anticipates that my patches, to change the welcome message when you
don't have any conf/local.conf file yet, have been accepted.

You may prefer to wait for such patches to be merged
before merging this one, just to make sure
that the documentation is consistent with the command output.

