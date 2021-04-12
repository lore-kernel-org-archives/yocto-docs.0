Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.991.1618250383449815176
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 10:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.210.254.211
Received: from [192.168.1.20] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8E61CC0005;
	Mon, 12 Apr 2021 17:59:40 +0000 (UTC)
Subject: Re: [docs] [PATCH]Variables - WKS_FILE tip finding one used
To: Janne Kiiskila <janne.kiiskila@pelion.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
References: <DBAPR08MB5558B9EA79319C4C09AC1802F3709@DBAPR08MB5558.eurprd08.prod.outlook.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <266de944-aab4-2e1d-021f-d722d15339e3@bootlin.com>
Date: Mon, 12 Apr 2021 19:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <DBAPR08MB5558B9EA79319C4C09AC1802F3709@DBAPR08MB5558.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Janne,

On 4/12/21 2:48 PM, Janne Kiiskila wrote:
>
>  
>
> Adding tip on how to find the WKS_FILE being used in the build.
>
> This information found from a StackOverflow article:
>
>  
>
> https://stackoverflow.com/questions/49912475/adding-a-partition-in-yocto-generated-image
> <https://stackoverflow.com/questions/49912475/adding-a-partition-in-yocto-generated-image>
>
>  
>
> provided by "Nayfe".
>
>  
>
> Attaching the patch as an attachment, since it seems Microsoft Outlook
> does something naughty with the whitespaces and thus corrupts the patch.
>

Thanks for the patch anyway! Next time you may actually include your
patch both as an inline attachment, so that people can comment on the
patch contents, and as a regular attachment so that I can apply the patch.

I have a small improvement to suggest in your patch. Here it is:

diff --git a/documentation/ref-manual/variables.rst
b/documentation/ref-manual/variables.rst
index 19f5e34c58..f083f77f95 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8794,6 +8794,9 @@ system and gives an overview of their function and
contents.
       section in the Yocto Project Development Tasks Manual. For details on
       the kickstart file format, see the ":doc:`/ref-manual/kickstart`"
Chapter.
 
+      To find out which WKS_FILE your build is using, you can run
+      ``bitbake -e |grep "^WKS_FILE="``
+
    :term:`WKS_FILE_DEPENDS`
       When placed in the recipe that builds your image, this variable lists
       build-time dependencies. The ``WKS_FILE_DEPENDS`` variable is only
-- 
2.17.1


Instead, I would just use (note the added space after the pipe, and the
removed double quotes):

bitbake -e | grep ^WKS_FILE=

At least, this would be consistent with a similar line in another manual:

documentation/dev-manual/common-tasks.rst:   $ bitbake -e basename |
grep ^WORKDIR=

Actually, still for consistency with this file (and with the majority of
other manuals), you could even write:

::

   $ bitbake -e | grep ^WKS_FILE=

If you agree, would you mind re-sending an update, please?

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

