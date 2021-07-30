Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.2059.1627671602211852202
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 12:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7F4742000B
	for <docs@lists.yoctoproject.org>; Fri, 30 Jul 2021 19:00:00 +0000 (UTC)
Subject: Re: [docs] [PATCH] manuals: initial documentation for CVE management
To: docs@lists.yoctoproject.org
References: <1696A6679AD2D10A.1941@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <44a78110-7108-c12b-d0c2-468eb1fe32b1@bootlin.com>
Date: Fri, 30 Jul 2021 20:59:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1696A6679AD2D10A.1941@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Greetings,

On 7/30/21 8:54 PM, Michael Opdenacker wrote:
> This starts to document vulnerability management
> and the use of the CVE_PRODUCT variable
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/dev-manual/common-tasks.rst | 46 +++++++++++++++++++++++
>  documentation/ref-manual/variables.rst    | 11 ++++++
>  2 files changed, 57 insertions(+)

In addition to your reviews of this particular text, I'm also interested
in further guidelines for managing CVEs in production projects.

I already asked such questions in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14419:

  * How to check for vulnerabilities in my image without regenerating
    it, and without runing "bitbake -c cve_check" on individual package
    names?
  * How to check production images for vulnerability checks? Anything
    better than manual or cronjob checks?

Thank you in advance for your advise for our readers!
Cheers,
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

