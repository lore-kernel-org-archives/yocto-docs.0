Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.1005.1618337008270272524
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 11:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from [192.168.1.20] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id ECF6B100003
	for <docs@lists.yoctoproject.org>; Tue, 13 Apr 2021 18:03:26 +0000 (UTC)
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: ref-manual: reverse the order of migration guides?
Organization: Bootlin
Message-ID: <7ff7831f-4539-8e5c-cfc6-d081651374f2@bootlin.com>
Date: Tue, 13 Apr 2021 20:03:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Greetings,

Wouldn't it make sense to reverse the order of migration guides in the
reference manual
(https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#migration)?

I guess it would be easier to start mentioning the migration path from
the most recent release, as version 1.3 looks ancient.

Would it make sense? If so, it's easy to propose a patch...

Thanks in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

