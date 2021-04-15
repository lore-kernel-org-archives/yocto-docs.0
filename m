Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web09.4847.1618481515287302553
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 03:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.226.152])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id DFD2AA2F43
	for <docs@lists.yoctoproject.org>; Thu, 15 Apr 2021 22:11:53 +1200 (NZST)
Authentication-Results: linuxplesk15.openhost.net.nz;
	spf=pass (sender IP is 151.210.226.152) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH v2 05/14] ref-manual: and SDK_CUSTOM_TEMPLATECONF to glossary
Date: Thu, 15 Apr 2021 22:11:53 +1200
Message-ID: <36785517.10thIPus4b@linc>
In-Reply-To: <0345a664fdf1076edaaeeea0d5b682598534cc58.1618480508.git.paul.eggleton@linux.microsoft.com>
References: <cover.1618480508.git.paul.eggleton@linux.microsoft.com>
	<0345a664fdf1076edaaeeea0d5b682598534cc58.1618480508.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
X-PPP-Message-ID: <20210415101154.3908052.80382@localhost6.localdomain6>
X-PPP-Vhost: softec.co.nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 15 April 2021 21:59:03 NZST Paul Eggleton wrote:
> +   :term:`SDK_CUSTOM_TEMPLATECONF`
> +      When building the extensible SDK, if ``SDK_CUSTOM_TEMPLATECONF`` is set to
> +      "1" and a ``conf/templateconf.conf`` file exists in the build directory
> +      (``TOPDIR``) then this will be copied into the SDK.

Just realised I forgot to fix the TOPDIR reference here as pointed out by
Quentin. I've pushed a new branch with that fixed.

Cheers
Paul



