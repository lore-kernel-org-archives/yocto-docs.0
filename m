Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.219.1617117553352016669
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 08:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from localhost (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9882C4000F
	for <docs@lists.yoctoproject.org>; Tue, 30 Mar 2021 15:19:11 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 0/1] YP overview manual: style improvements
Date: Tue, 30 Mar 2021 17:19:04 +0200
Message-Id: <20210330151905.13402-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm starting to read the YP manuals to better understand the
project and its resources.

This is also an opportunity to propose style updates, and
sometimes a more correct way of explaining some concepts.

Here are my first proposed improvements, this time
on the first part of the YP Overview Manual.

Note that this document was reviewed on an e-book reader
through Sphinx' "epub" export ("make epub"). Don't hesitate
to try this too, the output is pretty good, except for the graphics
that would need upscaling (at least in my case), but this
is another topic.

Thanks in advance for your reviews!

Michael.

