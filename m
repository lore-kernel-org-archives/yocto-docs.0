Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.10724.1623256998416636703
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Jun 2021 09:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 448EB6000D;
	Wed,  9 Jun 2021 16:43:16 +0000 (UTC)
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Quentin Schulz <foss@0leil.net>
Subject: Re: [PATCH v3] test-manual: add initial reproducible builds documentation
To: docs@lists.yoctoproject.org
References: <1686F0ED5A1183FF.18579@lists.yoctoproject.org>
 <20210609144728.103458-1-michael.opdenacker@bootlin.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <d95042a3-b685-73aa-c08b-adac28520f0c@bootlin.com>
Date: Wed, 9 Jun 2021 18:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609144728.103458-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

Commenting my own patch, before others do :-}

On 6/9/21 4:47 PM, Michael Opdenacker wrote:
> +The project's current reproducibility status can be seen at
> +https://www.yoctoproject.org/reproducible-build-results/

Oops, my bad, I could have used the :yocto_home: macro here. Will do.

> +
> +You can also check the reproducibility status on supported host distributions:
> +
> +-  CentOS: https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-centos
> +-  Debian: https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-debian
> +-  Fedora: https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-fedora
> +-  Ubuntu: https://autobuilder.yoctoproject.org/typhoon/#/builders/reproducible-ubuntu


Same here, will use :yocto_ab:

> +
> +===============================
> +Can I test my layer or recipes?
> +===============================
> +
> +Once again, you can run a ``world`` test using the
> +:ref:`oe-selftest <ref-manual/release-process:Testing and Quality Assurance>`
> +command provided above. This functionality is implemented
> +in `meta/lib/oeqa/selftest/cases/reproducible.py
> +<https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`_.


Same here, will use :yocto_git:

Pfooh, that was just in time before Quentin and Nico catch those ;-)

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

