Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.11192.1586943437887989874
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Apr 2020 02:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:54010 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jOeTs-009QZk-DP
	for docs@lists.yoctoproject.org; Wed, 15 Apr 2020 05:37:17 -0400
Date: Wed, 15 Apr 2020 05:37:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: currently making a list of doc-wide fixes for after next release
Message-ID: <alpine.LFD.2.21.2004150523580.7514@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  since i've messed around with documentation (here and elsewhere) for
a while (and since i've also played with docbook and XSL and
stylesheets), i figure i might as well start making a list of
potentially sweeping changes to the YP docs. (all of this is assuming
that the docs are keeping the same structure, correct?)

  first is to use proper docbook tags (semantically speaking), as in
-- don't tag everything as <filename> just to get monospaced
rendering. start using tags like <variable> and <command> and
<firstterm> and so on, and adjust the stylesheets to render
appropriately. even if the eventual rendering is identical, the
semantic tagging should properly distinguish between different items.

  adjust stylesheets so that code chunks (tagged with <literallayout>)
don't need to *literally* have indentation that matches how it's
rendered; allow arbitrary indentation in the XML files so it looks
nice, and let the stylesheets take it from there and indent properly.

  standardize admonitions (<important>, <note>, <tip>, <caution>,
<warning>) so that they all use <para> even if they contain just a
single paragraph. this is currently inconsistent, so that some
admonitions are rendered with different spacing, you can see this
here:

https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PARALLEL_MAKE

where the caution and note for PARALLEL_MAKE has narrower vertical
spacing than the "Notes and Cautions" for PARALLEL_MAKEINST right
after it -- that's because the latter uses <para></para> to tag
paragraphs, and the former does not.

  and regarding admonitions, use the correct one with a proper title
-- i've seen <note>s with the title attribute "Caution" ... that's not
right. :-)

  anyway, i've started a list; feel free to toss out other ideas that
can be added to the list.

rday
