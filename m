Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web09.413.1619109768893040034
 for <docs@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 09:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4FR3BG4n9hz5tl9;
	Thu, 22 Apr 2021 18:42:46 +0200 (CEST)
Date: Thu, 22 Apr 2021 18:42:45 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: Add incompatibility warning for SERIAL_CONSOLES_CHECK
Message-ID: <20210422164245.qdxj4crtcl7ro2up@qschulz>
References: <16783B7361829FC0.16298@lists.yoctoproject.org>
 <20210422163940.300616-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210422163940.300616-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 06:39:40PM +0200, Michael Opdenacker wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> See [YOCTO #13921]
> 
> Add details to the SERIAL_CONSOLES_CHECK entry to clarify that it
> doesn't work with read-only rootfs.
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Reviewed-by: Quentin Schulz <foss@0leil.net>

Thanks!
Quentin
