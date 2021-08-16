Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.21442.1629102238409579520
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Aug 2021 01:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:35866 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mFXuW-0003Oh-HQ
	for docs@lists.yoctoproject.org; Mon, 16 Aug 2021 04:23:57 -0400
Date: Mon, 16 Aug 2021 04:23:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] explaining "wks.in" files in wic docs
In-Reply-To: <169BBB8D7D5EDA26.3513@lists.yoctoproject.org>
Message-ID: <7eef6de0-1e1a-f31f-d998-d5ed521c8062@crashcourse.ca>
References: <169BBB8D7D5EDA26.3513@lists.yoctoproject.org>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Aug 2021, Robert P. J. Day wrote:

>   a related number of issues related to explaining the existence of --
> and rationale for -- "wks.in" files. at the moment, i see nothing in
> this section:
>
> http://docs.yoctoproject.org/dev-manual/common-tasks.html#creating-partitioned-images-using-wic
>
> that covers the possibility of "wks.in" files (unless i totally missed
> it).
>
>   down in section 3.16.5:
>
> http://docs.yoctoproject.org/dev-manual/common-tasks.html#using-an-existing-kickstart-file
>
> one reads how to list all the available images with "wic list images",
> and one of those listed (canned) images is "genericx86", and a bit
> further down, you read:
>
> "Here are the actual partition language commands used in the
> genericx86.wks file to generate an image"
>
>   except there is no file "genericx86.wks", it's "genericx86.wks.in"
> which caused me a few minutes of confusion as i tried to "find" it.
>
>   as i understand it, the only additional feature with "wks.in" files
> is that they would contain variables that need pre-processing. and if
> that's true, where in the wic processing could someone specify that a
> "wks.in" file is to be used?
>
>   i'm looking at the wic script (line 172) and i see:
>
>     if not wks_file.endswith(".wks"):
>         wks_file = engine.find_canned_image(scripts_path, wks_file)
>         if not wks_file:
>             raise WicError("No image named %s found, exiting.  (Use 'wic list images' "
>                            "to list available images, or specify a fully-qualified OE "
>                            "kickstart (.wks) filename)" % options.wks_fi
>
> but that seems to recognize only the ".wks" suffix. where is the
> support for an explicit "wks.in" file?

  never mind, found what i was looking for in image_types_wic.bbclass:

python () {
    if d.getVar('USING_WIC'):
        wks_file_u = d.getVar('WKS_FULL_PATH', False)
        wks_file = d.expand(wks_file_u)
        base, ext = os.path.splitext(wks_file)
        if ext == '.in' and os.path.exists(wks_file):


rday
