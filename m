Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.13243.1618935022924909134
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 09:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.10] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BC27260009;
	Tue, 20 Apr 2021 16:10:20 +0000 (UTC)
Cc: michael.opdenacker@bootlin.com
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: Vector sources for the manual figures ?
Organization: Bootlin
Message-ID: <7f2f05a5-7492-ff74-e756-09937f59643f@bootlin.com>
Date: Tue, 20 Apr 2021 18:10:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Greetings,

In the YP manual sources, all the figures are in PNG format. Except for
screenshots, that's far from ideal for high resolution printing and viewing!

Don't we have vector sources of such diagrams anywhere, so that I can
export them to SVG? Don't tell me they were lost during the migration to
Egypt. I mean the migration to Sphinx ;-P

In particular, I'm asking because I managed to find a way to see the
figures in full-width in the epub output (using my KOBO reader to read
the manuals when I'm not in front of my computer, but the figures are
always too small and therefore unreadable). You just need to add
":width: 100%" to each image insertion, and this doesn't seem to disturb
the HTML output which already looks correct.

I'll propose a patch soon, but the results would be even better with
vector figures :)

Thanks in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

