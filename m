Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.942.1626883907717680891
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 09:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7CD8320006
	for <docs@lists.yoctoproject.org>; Wed, 21 Jul 2021 16:11:45 +0000 (UTC)
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: "metadata": plural or singular or both?
Organization: Bootlin
Message-ID: <8b294bc7-ab17-3dab-2cf6-ef2af316ca00@bootlin.com>
Date: Wed, 21 Jul 2021 18:11:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Greetings,

I'm currently reading BitBake's documentation, and I'm always
uncomfortable when I read "Metadata is", while I know that in English
and in Latin, "data" is the plural of "datum". However, many people seem
to use "data" as singular.

I also find confusing that actually "metadata" is both used:

  * in plural form as in: "Split metadata into layers and allow layers
    to enhance or override other layers."
  * in singular form as in: "Metadata is stored in recipe (|.bb|) and
    related recipe “append” (|.bbappend|) files"

How do you feel about this? I'm especially interested in the feedback
from native English speakers, which I'm not.

Thank you in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

