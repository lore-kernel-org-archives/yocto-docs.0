Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.815.1603733822409062939
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 10:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.231, mailfrom: foss@0leil.net)
Received: from webmail.gandi.net (webmail28.sd4.0x35.net [10.200.201.28])
	(Authenticated sender: foss@0leil.net)
	by relay11.mail.gandi.net (Postfix) with ESMTPA id F3AF2100009;
	Mon, 26 Oct 2020 17:36:58 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 26 Oct 2020 18:36:58 +0100
From: "Quentin Schulz" <foss@0leil.net>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: docs@lists.yoctoproject.org, leimaohui@cn.fujitsu.com
Subject: Re: [docs] [PATCH] dev-manual/dev-manual-common-tasks: fix warning
In-Reply-To: <20201026075036.367907-1-nicolas.dechesne@linaro.org>
References: <20201026075036.367907-1-nicolas.dechesne@linaro.org>
Message-ID: <49832ec4d2afa2395cae913fd9af0906@0leil.net>
X-Sender: foss@0leil.net
User-Agent: Roundcube Webmail/1.3.15
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicolas,

On 2020-10-26 08:50, Nicolas Dechesne wrote:
> A new warning was introduced in
> 59908cecb528 (docs: Updated the status of spdx module.)
> 
> The code-block section belongs to the #3 item in the enumerated
> list. While at it, also fixed a typo in the text.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  .../dev-manual/dev-manual-common-tasks.rst    | 35 +++++++++----------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst
> b/documentation/dev-manual/dev-manual-common-tasks.rst
> index dedc30d7d..e1ee03da8 100644
> --- a/documentation/dev-manual/dev-manual-common-tasks.rst
> +++ b/documentation/dev-manual/dev-manual-common-tasks.rst
> @@ -11487,26 +11487,23 @@ this function, you have to follow the 
> following steps:
>  2. Refer to the README in meta-spdxscanner to setup the environment 
> (e.g,
>     setup a fossology server) needed for the scanner.
> 
> -3. Meta-spdxscanner provids several methods within the bbclass to
> create spdx files.
> +3. Meta-spdxscanner provides several methods within the bbclass to
> create spdx files.
>     Please choose one that you want to use and enable the spdx task. 
> You have to
> -   add some config options in
> -``local.conf`` file in your
> -:term:`Build Directory`.
> -The following is an example showing how to generate spdx files during 
> bitbake
> -using the fossology-python.bbclass:
> -::
> -
> -   # Selet fossology-python.bbclass.
> -   INHERIT += "fossology-python"
> -   # For fossology-python.bbclass, TOKEN is necessary, so, after setup 
> a
> -   # Fossology server, you have to create a token.
> -   TOKEN = "eyJ0eXAiO..."
> -   # The fossology server is necessary for fossology-python.bbclass.
> -   FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
> -   # If you want to upload the source code to a special folder:
> -   FOLDER_NAME = "xxxx" //Optional
> -   # If you don't want to put spdx files in tmp/deploy/spdx, you can 
> enable:
> -   SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
> +   add some config options in ``local.conf`` file in your :term:`Build
> +   Directory`. The following is an example showing how to generate 
> spdx files
> +   during bitbake using the fossology-python.bbclass::

Probably want to have ``fossology-python.bbclass`` but also a third 
colon to "end"
the sentence?

> +
> +      # Selet fossology-python.bbclass.

s/Selet/Select/

> +      INHERIT += "fossology-python"
> +      # For fossology-python.bbclass, TOKEN is necessary, so, after 
> setup a
> +      # Fossology server, you have to create a token.
> +      TOKEN = "eyJ0eXAiO..."
> +      # The fossology server is necessary for 
> fossology-python.bbclass.
> +      FOSSOLOGY_SERVER = "http://xx.xx.xx.xx:8081/repo"
> +      # If you want to upload the source code to a special folder:
> +      FOLDER_NAME = "xxxx" //Optional
> +      # If you don't want to put spdx files in tmp/deploy/spdx, you 
> can enable:
> +      SPDX_DEPLOY_DIR = "${DeployDir}" //Optional
> 

s/${DeployDir}/${DEPLOY_DIR}/

but not entirely sure since DEPLOY_DIR/spdx is the default according to 
the bbclass.

BTW, there's also a "hardcoded" link to cgit instead of using 
:yocto_git: just after the
code-block section.

Thanks,
Quentin
