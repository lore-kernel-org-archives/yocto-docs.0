Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.4825.1623959743406904748
 for <docs@lists.yoctoproject.org>;
 Thu, 17 Jun 2021 12:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4A2AC20002;
	Thu, 17 Jun 2021 19:55:41 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: JPEWhacker@gmail.com,
	docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [RFC 0/1] initial documentation for hash equivalence
Date: Thu, 17 Jun 2021 21:55:29 +0200
Message-Id: <20210617195530.258307-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings

This is a first documentation attempt for hash equivalence.
I need to know if I'm headed in the right direction before expanding
the text if needed.

So, I would be interested in your opinion about:

- Is this the right level of detail?
  Don't forget that this is turned on by default in Poky
  and therefore easy to use.

  Would I need to add more details about the implementation,
  such as using explaining unihashes and adding diagrams such
  as the ones in Joshua Watt's presentation on the topic?

- It this the right place to add such documentation?

- Doesn't this need a more thorough update of the whole
  documentation about share state cache to give the new
  full picture right away, rather than adding this new
  feature later in the manual ?

- Anything else that I should mention?

- Anything wrong or that I misunderstood?

Michael Opdenacker (1):
  overview-manual: initial documentation for hash equivalence

 documentation/overview-manual/concepts.rst | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

-- 
2.25.1

