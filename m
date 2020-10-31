Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.1072.1604157249856344827
 for <docs@lists.yoctoproject.org>;
 Sat, 31 Oct 2020 08:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:57372 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYsZz-00AboO-LK
	for docs@lists.yoctoproject.org; Sat, 31 Oct 2020 11:14:08 -0400
Date: Sat, 31 Oct 2020 11:14:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: generic admonition versus specific admonitions
Message-ID: <c0ac296c-525f-b22b-4ef6-3dc0f5e36ae6@crashcourse.ca>
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


  as i'm sure you're all aware, reST supports a number of specific
admonition types (note, info, error, caution, ...), plus a generic
form that is used thusly:

.. admonition::

   blah blah

i was interested to see that the use of the generic admonition is
confined exclusively to a single .rst file in the profiling manual:

$ grep -r "\.\. admonition" *
profile-manual-arch.rst:.. admonition:: Tying it Together
profile-manual-usage.rst:.. admonition:: Tying it Together
profile-manual-usage.rst:.. admonition:: Tying it Together
profile-manual-usage.rst:.. admonition:: Tying it Together
profile-manual-usage.rst:.. admonition:: Tying it Together
profile-manual-usage.rst:.. admonition:: Tying it Together
profile-manual-usage.rst:.. admonition:: Tying it Together
profile-manual-usage.rst:.. admonition:: Tying it Together
profile-manual-usage.rst:.. admonition:: Tying it Together
profile-manual-usage.rst:.. admonition:: Tying it Together
profile-manual-usage.rst:.. admonition:: Tying it Together
$

a few seconds research showed that, while it seems overly bland to use
a generic admonition, it has one cool advantage.

  if you use, say ".. note::", then the rendered note always has the
caption "Note" by default -- if you add a caption on that same line,
that caption becomes the first line *inside* the note box, while the
box caption continues to say simply, "Note".

  with a generic admonition, however, if you add a caption like, say,
in that profile file:

.. admonition:: Tying it Together

then that caption becomes the top-level caption of the admonition box,
which adds some emphasis to the caption.

  should there be an aesthetic standard?

rday
