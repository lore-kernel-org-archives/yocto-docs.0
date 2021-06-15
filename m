Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.11806.1623773646882380599
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 09:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3916C1BF209
	for <docs@lists.yoctoproject.org>; Tue, 15 Jun 2021 16:14:05 +0000 (UTC)
To: YP docs mailing list <docs@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Subject: Documentation to install an ESDK out of date?
Organization: Bootlin
Message-ID: <84681300-15a8-d63e-786c-b0f7d3a8a476@bootlin.com>
Date: Tue, 15 Jun 2021 18:14:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

I'm following the documentation to install an ESDK:
https://docs.yoctoproject.org/sdk-manual/extensible.html#installing-the-extensible-sdk

Several issues though:

  * The documentation doesn't say where to download ESDKs from, though I
    guess it should be
    https://www.yoctoproject.org/software-overview/downloads/
  * From this URL, I downloaded and ran
    http://downloads.yoctoproject.org/releases/yocto/yocto-3.3.1/buildtools/x86_64-buildtools-nativesdk-standalone-3.3.1.sh.
    However, I didn't find the "devtool" or "run_qemu" scripts than the
    documentation mentions.
  * Why don't we release ESDKs for arm or arm64 and other architectures?

Am I right to suspect that this part of the documentation is out of date?

Thanks in advance,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

