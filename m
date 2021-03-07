Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.22714.1615131861317646677
 for <docs@lists.yoctoproject.org>;
 Sun, 07 Mar 2021 07:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:55782 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lIvZr-0007Un-RH
	for docs@lists.yoctoproject.org; Sun, 07 Mar 2021 10:44:20 -0500
Date: Sun, 7 Mar 2021 10:44:16 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] possible better wording to describe bitbake functions?
In-Reply-To: <166A19276473FD9D.31138@lists.yoctoproject.org>
Message-ID: <51939c4e-8937-2a23-9230-65db83b3479d@crashcourse.ca>
References: <166A19276473FD9D.31138@lists.yoctoproject.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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

On Sun, 7 Mar 2021, Robert P. J. Day wrote:

>
>   perusing bitbake user manual, section 3.5, "Functions", which
> opens with:
>
> "As with most languages, functions are the building blocks that are
> used to build up operations into tasks. BitBake supports these types
> of functions:
>
>   * Shell Functions: Functions written in shell script and executed
>     either directly as functions, tasks, or both. They can also be
>     called by other shell functions.
>
>   * BitBake-Style Python Functions: Functions written in Python and
>     executed by BitBake or other Python functions using
>     bb.build.exec_func().
>
> ... snip ...
>
> however, it's clear that one can also invoke shell functions from
> python functions via bb.build.exec_func() as well, as with this
> example from buildhistory.bbclass. here's an obvious shell function:
>
>   buildhistory_commit() {
>         if [ ! -d ${BUILDHISTORY_DIR} ] ; then
>         ... snip ...
>
> being invoked from a python routine:
>
>   python buildhistory_eventhandler() {
>        ... snip ...
>                 bb.build.exec_func("buildhistory_commit", localdata)
>
>
> so is there a clearer way to word this to clarify that shell
> functions are also callable via bb.build.exec_func()? or is that
> somehow implied by the current wording?

  never mind, just noticed that the above is explained further down
that chapter in a Note.

rday
