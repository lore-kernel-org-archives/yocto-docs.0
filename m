Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web10.7959.1621515615011157013
 for <docs@lists.yoctoproject.org>;
 Thu, 20 May 2021 06:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4Fm8wX10K2z5tlC;
	Thu, 20 May 2021 15:00:11 +0200 (CEST)
Date: Thu, 20 May 2021 15:00:10 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] wanting to clarify "FILES_*" and wildcarding
Message-ID: <20210520130010.bpnshizfd5h6mdlg@qschulz>
References: <358d7961-9a28-8fce-adb4-54e54021270@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <358d7961-9a28-8fce-adb4-54e54021270@crashcourse.ca>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

On Sat, May 15, 2021 at 05:43:01AM -0400, Robert P. J. Day wrote:
> 
>   i just got burned by the way someone defined the constitution of
> packages for an internal recipe a while back because of the way they
> claim to have read the documentation, so i want to clarify a couple
> things about what can be assigned to the variations of "FILES_*", and
> i might submit a patch to be emphatic about how things work.
> 
>   so here:
> 
> http://docs.yoctoproject.org/ref-manual/variables.html#term-FILES
> 
> the glossary entry does mention Python's glob syntax for wildcarding,
> but muh colleague wasn't sure how that applied to directory names, and
> arbitrarily switched back and forth between:
> 
>   FILES_${PN} += "/bin"
>   FILES_${PN} += "/bin/*"
> 
> thinking those were equivalent, and in a lot of cases, they would be,
> but the second variant would not pick up any hidden objects like
> ".debug", correct? which is why the build just exploded when it was
> extended to start adding static libraries -- the first variant was
> being used and all of the static libs were suddenly being added to the
> base package and bad things happened. so is the fundamental difference
> between those two variants the processing of hidden files and nothing
> else?
> 
>   second minor observation is that the current assignments use
> hard-coded names -- /bin instead of, say, ${bindir} -- so i'm going to
> note people shouldn't do that.
> 
>   last thing that truly caused trouble was someone thinking you needed
> to define the files list one directory level at a time, as in, to
> include the shared libs:
> 
>   FILES_${PN} = "/usr"
>   FILES_${PN} += "/usr/lib64"
>   FILES_${PN} += "/usr/lib64/lib*.so*"
> 
> i'm not sure where someone got the idea that you needed to do this one
> directory at a time as, since inclusion works recursively, that first
> assignment picks up all of /usr, and that also caused grief as soon as
> static libs were added to the build.
> 
>   i see nothing in the current definition of FILES that would inspire
> anyone to do this, but maybe it's worth adding to the "Note" a caution
> against doing that.
> 
>   thoughts? then i'll submit a patch.
> 

I have hit this issue some time ago already. Only remembering vaguely,
but I think the issue is when you have the following:

do_install() {
	install -d ${D}/usr/lib64
	# installs nothing in /usr/lib64
}

This can be because the cmake/makefile/whatever is faulty and creates
the directory even though there's nothing to write in there, or (more
likely) a user error, with potentially a forloop or a find -exec that
matches no file but you need the directory to be created otherwise if
there were matches the task would fail.

In that case, the directory **is** installed by the task but if you have
only:
FILES_${PN} = "/usr/lib64/lib*.so*"
it obviously does not match and /usr/lib64 might end up not being
installed in any package, thus failing the recipe build.

I haven't tested what I'm saying, so might be completely wrong.

Cheers,
Quentin
