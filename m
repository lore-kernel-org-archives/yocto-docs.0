Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.10428.1619784679073817727
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 05:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:49594 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lcRzJ-0002MV-R4
	for docs@lists.yoctoproject.org; Fri, 30 Apr 2021 08:11:18 -0400
Date: Fri, 30 Apr 2021 08:11:14 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: trying to keep the variable glossary up to date
Message-ID: <e1a39395-2a7c-895f-a977-d6baf87fba94@crashcourse.ca>
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


  unsurprisingly, the list of variables in the variable glossary lags
noticeably behind all of the recent (and even not so recent) variables
in use. as one example i'm perusing right now, there are a number of
BUILDHISTORY-related variables that aren't in the glossary, such as:

  BUILDHISTORY_RESET
  BUILDHISTORY_SDK_FILES
  BUILDHISTORY_DIR_IMAGE
  BUILDHISTORY_DIR_PACKAGE

there's more but that's enough to make the point, which inspires the
obvious question -- is it even worth trying to keep up?

  is there a reasonably methodical way to try to stay on top of this?
or is that just doomed to failure? certainly, there are variables that
are totally local to some focused bit of processing and merit no
explanation, but for any variables that might be of interest to the
developer, is it the goal for *all* of those variables to be in the
glossary?

rday
