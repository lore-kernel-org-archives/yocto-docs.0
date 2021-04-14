Received: from linuxplesk15.openhost.net.nz (linuxplesk15.openhost.net.nz [119.47.118.83])
 by mx.groups.io with SMTP id smtpd.web11.6028.1618359337706207234
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 17:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 119.47.118.83, mailfrom: bluelightning@bluelightning.org)
Received: from linc.localnet (unknown [151.210.226.152])
	by linuxplesk15.openhost.net.nz (Postfix) with ESMTPSA id 8337DA0B29;
	Wed, 14 Apr 2021 12:15:33 +1200 (NZST)
Authentication-Results: linuxplesk15.openhost.net.nz;
	spf=pass (sender IP is 151.210.226.152) smtp.mailfrom=bluelightning@bluelightning.org smtp.helo=linc.localnet
Received-SPF: pass (linuxplesk15.openhost.net.nz: connection is authenticated)
From: "Paul Eggleton" <bluelightning@bluelightning.org>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>, "Tummalapalli,
	Vineela" <vineela.tummalapalli@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [docs] ref-manual: reverse the order of migration guides?
Date: Wed, 14 Apr 2021 12:15:32 +1200
Message-ID: <4706379.0VBMTVartN@linc>
In-Reply-To: <7ff7831f-4539-8e5c-cfc6-d081651374f2@bootlin.com>
References: <7ff7831f-4539-8e5c-cfc6-d081651374f2@bootlin.com>
MIME-Version: 1.0
X-PPP-Message-ID: <20210414001533.482966.22158@localhost6.localdomain6>
X-PPP-Vhost: softec.co.nz
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Michael

On Wednesday, 14 April 2021 06:03:26 NZST Michael Opdenacker wrote:
> Wouldn't it make sense to reverse the order of migration guides in the
> reference manual
> (https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#migration)
> ?
> 
> I guess it would be easier to start mentioning the migration path from
> the most recent release, as version 1.3 looks ancient.
> 
> Would it make sense? If so, it's easy to propose a patch...

I guess the thinking was that you would start at the point in the 
documentation where you are currently at and then follow it downwards to the 
current version. Whether that's the most logical I'm not sure, but if we're 
changing it we should give some thought to how it will be used. People do 
often go a while between upgrades, but I'll definitely agree 1.3 is much 
further back than most people would need.

Robert suggests moving it out, I'm wondering if it's worth considering going a 
step further and turning our release notes into a proper document, to which 
this content would be added - I've often felt that the current text-only 
format is a bit restrictive. That would mean there would be a separate 
document per release, which is how many other software packages do it (e.g. 
Django). However, I'm not sure if that would cause us too much overhead or 
hassle with the other places where we currently post the release notes e.g. 
announcements on the mailing list - thoughts? (For clarity I wouldn't propose 
changing this until the next release.)

Cheers
Paul


