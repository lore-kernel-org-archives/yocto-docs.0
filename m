Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.3541.1617106553820134800
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 05:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 211751BF209
	for <docs@lists.yoctoproject.org>; Tue, 30 Mar 2021 12:15:51 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Subject: Fix suspicious newlines
Date: Tue, 30 Mar 2021 14:15:39 +0200
Message-Id: <20210330121540.10101-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings,

This is a first batch of updates for you to review before
I continue.

There seems to be many more newline issues like these,
which could reveal potential documentation migration issues.
I'll carefully review each type.

Thanks in advance
Michael.


