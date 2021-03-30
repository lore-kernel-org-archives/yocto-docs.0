Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.1907.1617095479255429532
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 02:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 017C360014
	for <docs@lists.yoctoproject.org>; Tue, 30 Mar 2021 09:11:16 +0000 (UTC)
Subject: Re: [docs] [PATCH v2] Fix typos and spacing
To: docs@lists.yoctoproject.org
References: <1670DBAEE41FDB10.32129@lists.yoctoproject.org>
 <1670E9A93CE5834F.22540@lists.yoctoproject.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9b813316-52e7-4da0-da77-6b03d503aded@bootlin.com>
Date: Tue, 30 Mar 2021 11:11:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1670E9A93CE5834F.22540@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/29/21 10:19 PM, Michael Opdenacker wrote:
> Fix double words, punctuation spacing issues, spacing issues,
> "its" instead of "it's", and other trivial issues.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/README                             |  2 +-
>  documentation/bsp-guide/bsp.rst                  |  4 ++--
>  documentation/dev-manual/common-tasks.rst        |  8 ++++----
>  documentation/kernel-dev/common.rst              |  2 +-
>  documentation/kernel-dev/maint-appx.rst          |  2 +-
>  documentation/overview-manual/yp-intro.rst       | 16 ++++++++--------
>  documentation/profile-manual/usage.rst           |  4 ++--
>  documentation/ref-manual/TODO                    |  6 +++---
>  documentation/ref-manual/classes.rst             |  2 +-
>  documentation/ref-manual/faq.rst                 |  2 +-
>  documentation/ref-manual/migration-1.7.rst       |  2 +-
>  documentation/ref-manual/release-process.rst     |  2 +-
>  documentation/ref-manual/system-requirements.rst |  2 +-
>  documentation/ref-manual/variables.rst           |  4 ++--
>  .../sdk-manual/appendix-customizing.rst          |  2 +-
>  .../test-manual/understand-autobuilder.rst       |  4 ++--
>  documentation/toaster-manual/reference.rst       |  2 +-
>  17 files changed, 33 insertions(+), 33 deletions(-)


Applied to "master-next":
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=master-next&id=1fd54a2a97aba047e5a961a0de8128e836d92d27
This way I don't see the whitespace issues I already fixed when I'm
preparing and submitting a new patch.

I prefer to send new patches that start from master-next.

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

