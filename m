Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.992.1603734456116943236
 for <docs@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 10:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
Received: from webmail.gandi.net (webmail28.sd4.0x35.net [10.200.201.28])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPA id B43A860002;
	Mon, 26 Oct 2020 17:47:33 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 26 Oct 2020 18:47:33 +0100
From: "Quentin Schulz" <foss@0leil.net>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/2] docs: static: theme_overrides.css: fix responsive design on <640px screens
In-Reply-To: <20200918081406.zr6u2evo55tfmgvz@qschulz>
References: <20200917210947.51974-1-foss@0leil.net>
 <CAP71Wjwm_LYCVGAhm8O+0tC1K=aCLhwjmF_j5mh_gJGi4nYmJw@mail.gmail.com>
 <20200918081406.zr6u2evo55tfmgvz@qschulz>
Message-ID: <91be94be029787448f6fb8c43eba8525@0leil.net>
X-Sender: foss@0leil.net
User-Agent: Roundcube Webmail/1.3.15
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

On 2020-09-18 10:14, Quentin Schulz wrote:
[...]
> Also, I've spent an hour or sotrying to find a solution to make sphinx 
> detect
> static files changes but couldn't figure anything out.
> Beware, removing the _build/html directory isn't even enough to copy
> newly changed static files. I had to remove the whole _build directory
> to make it rebuild. There's probably a smarter way to do it but for
> automation you might to know what does not work well for now.
> 
> c.f.: https://github.com/sphinx-doc/sphinx/issues/2090
> 
> I didn't want to go the route of the last comment which is ALWAYS
> rebuilding index.rst and didn't want to hack to much.
> 
> So, static_css_files and static_js_files are copied only on the first
> build but not later on.
> 

Just to update on this, css/js files aren't watched over. However I 
believe this
is not an issue since css/js files are **always** copied when at least 
one page
is being regenerated. They are just not copied over when they're the 
only files
changed. This basically makes css/js development/debugging much more 
cumbersome
but it's fine for production since there's probably always going to be a 
commit
changing at least one doc page soon after a css/js change?

Quentin
