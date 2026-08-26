Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A24CC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 19:56:55 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21255.1787774205448600225
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Aug 2026 12:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FaeIuSiu;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-938cd95b06eso19138385a.1
        for <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 12:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787774204; x=1788379004; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LVqSfYXtcKBictedUNoWxgsT/FUJUucFDmbzu5b/G6w=;
        b=FaeIuSiuGNzhIVN6bQYmsmeZuRarCherInvlIvEiis6aSei9f8qeyP9fseTHrquB/C
         yJQx2OPnWAA9V6qdFkGRJSBvrEjhcWVb0nGeYDBp6R2OAVx+EHVHN7tvpcmy52bzz+mz
         X44Fvq4MVNSWCP3iL3XXN0ZufQhiHDqRfzydKxUHWbu+hsRhokmEosyqovrrdISW54Nk
         hPgdpwulr0GKU5gyrbxhVB1tDzATZt8WwdacukZ5kdgTpKjou3ihA1seS1BKUq6lkrhc
         aownehW3+GgRGcN8Y7tvW149skia16vnSH2vr491Cjqwv2ZfF1pkoxATYwM0DhvIssrW
         1qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787774204; x=1788379004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LVqSfYXtcKBictedUNoWxgsT/FUJUucFDmbzu5b/G6w=;
        b=KYVZYq9Rh8fgk5LQmB16VKC7EBDtXIjs7JW+nfAOmGsCVUz+TOH1UjIh6opjOwALJ2
         z5SDzC2nZq9KjyN+Q2nqKEHlIwxevokXZhs0HM1YlIUTFNYyBR/0z0dwRXC9Gi6Lbk5I
         w4HDxefHBsBdiSyMTFil05++U1z7967588JVZsDOreOFy18/8pLAAVNGpDjK1qVgAvve
         K2ddLiE+H52IqB0m8QtH4GAsAhv387lyILXDQ1WbRNPmxzLz+gIc3FCJK2fD+DPgwv9x
         geZutRSNC4PBaUUeR/XdUUIKyJTv57AklltSLLhLwdf2h+deH8lC1xtgt1rW2yPy6fES
         vyTg==
X-Forwarded-Encrypted: i=1; AHgh+RqekJp2rgUAFXeU0oXFTI2avSololTvo+nmBM8uEr6N2gXbUMeywnn7Iy8kfXWme+BDek+Q@lists.yoctoproject.org
X-Gm-Message-State: AFuF++mOuGkT/OPwbcA1Re0yV/JcSKzulXk5xg26ar/zX+bCUZ6PWIYO
	8UUEgD8in+OH8goy6utfJSONE1z8H5ddpQv7jm2GoC9FZrQJ6rDZdbBv
X-Gm-Gg: AR+sD11YFJ/ipVej2LzMDZ5f8oGtr0QRxwquC5700BCByrMmupHP9choXQhytUN3PuN
	HRVmYFTIrBau09xtnU/BGfHckN4WCdrEp7EJRzF7ugQOGFc/7nFncXkv5D9iMqXjpAw3QpOPCBW
	irsscDsxYuooesqQNlwYfFqyFSMBxexg9C4YYe8eLWTSrO63JPVtOxKWuf6vtIVZ/xYJ95Ip2PI
	APfKV4s4XqhTevmkYbqymuQ2/o4Xf+7J1L6VCVl4R5gsVe+w913sS5+g9HJzh7LSFS+BD9tVBrY
	za/eCF+M932iGPw3ETt7Wz5HbI8rJwZPFECGc4BbWe41eR7XwnV8szlPzCiS2PysJi3vN/pa4CK
	booP5xYYCeXyKYEic6CzO/rXDTDXDk4J5Ii7KuhVdsKOsaUfcj5+NWA46p7oCpI+4zlTaf/PxXk
	ZMJxzhq1gfrVPGKsl+yQClRsuJKPObfNoshd8RitxViP0OmBWT3P5lK7oCBgKv8DzAYuYQ7Hihg
	up1ZMwoUJlan4/w2c2WZiqe4dy1yd0wDpTxhyxojQ==
X-Received: by 2002:a05:620a:298e:b0:937:4550:96c9 with SMTP id af79cd13be357-939005c0310mr184830685a.21.1787774203831;
        Wed, 26 Aug 2026 12:56:43 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e30ed19sm288537585a.8.2026.08.26.12.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 12:56:43 -0700 (PDT)
Date: Wed, 26 Aug 2026 15:56:40 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 00/10] docs: highlight BitBake snippets with the
 bitbake language
Message-ID: <ao9E-I2EAyMrtlIR@localhost.localdomain>
References: <20260826013502.2674000-1-twoerner@gmail.com>
 <34c79745-33ff-41dd-bb85-144bb26b02a2@cherry.de>
 <DKYWEFNK1215.22ZC7DOYBOIH9@bootlin.com>
 <ao7pU4NN4uuZDzS1@localhost.localdomain>
 <66624f77-ae0d-4670-bd99-c6ea9d2b2a54@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66624f77-ae0d-4670-bd99-c6ea9d2b2a54@cherry.de>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Aug 2026 19:56:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10371

On Wed 2026-08-26 @ 04:45:33 PM, Quentin Schulz wrote:
> 
> 
> On 8/26/26 3:25 PM, Trevor Woerner via lists.yoctoproject.org wrote:
> > On Wed 2026-08-26 @ 03:09:23 PM, Antonin Godard wrote:
> > > Hi,
> > > 
> > > On Wed Aug 26, 2026 at 2:10 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
> > > > Hi Trevor,
> > > > 
> > > > On 8/26/26 3:34 AM, Trevor Woerner via lists.yoctoproject.org wrote:[...]>>>
> > > > [...]
> > > > 
> > > > > Depends on
> > > > > ----------
> > > > > 
> > > > > "docs: state the language of nine literal blocks explicitly", sent
> > > > 
> > > > Link to the ML please to make maintainers and reviewers job easier.
> > > > 
> > > > [...]
> > > > 
> > > > I think this is going the wrong direction. We should actually make
> > > > explicit the language of every :: that is NOT to be understood as
> > > > BitBake code and then make the default highlight language be BitBake.
> > > 
> > > But then this might get forgotten? How about having the default highlighted as
> > > "none", and make _everything_ use explicit code-blocks?
> > > 
> > > Sure, this is more efforts and review time, but also this is how other markup
> > > languages work - like markdown, where by default (when using ```...```) no
> > > syntax highlighting is done.
> > > 
> > > This is maybe a more conservative approach but at least it doesn't leave room
> > > for code blocks mistakenly highlighted with the bitbake lexer.
> > 
> > Yes, I agree too.  Personally I'm not fond of "hidden defaults".
> > 
> 
> There's already one.

True. So the choice is between:
- guessing python
- guessing bitbake
- or having the author state the expected language of every code-block

Personally my preference would be for every block to state it's expected
language. I don't think that's either too onerous or redundant. We put
".bb" and ".bbclass" at the end of every bitbake and bitbake class file
even though it's obvious what they are by virtue of where the live or
what the contain. In general we put ".html" at the end of html files and
".txt" at the end of text files.

But assuming I can't convince everyone that the language should be
explicit on each block, (and that each such item should have an explicit
"code-block:: <lang>" tag) the discussion devolves into: which default
is wrong least often :-) So i asked AI to measure it across all
currently untagged blocks:


                                lexed   correct   wrong   unclass   plain   visibly
                                        (known)  (known)                     wrong
   ━━━━━━━━━━━━━━━━━━━━━━━━━  ━━━━━━━  ━━━━━━━━  ━━━━━━━  ━━━━━━━━  ━━━━━━  ━━━━━━━
    yocto-docs
      bitbake                    1502       841        9       652       0       96
      python (today)              782         5      635       142     720      777
      none                          0         0        0         0    1502        0
   ─────────────────────────  ───────  ────────  ───────  ────────  ──────  ───────
    BitBake user manual
      bitbake                     299       193        6       100       0       16
      python (today)              182         6      148        28     117      176
      none                          0         0        0         0     299        0
   ─────────────────────────  ───────  ────────  ───────  ────────  ──────  ───────
    both
      bitbake                    1801      1034       15       752       0      112
      python (today)              964        11      783       170     837      953
      none                          0         0        0         0    1801        0


Setting the default to bitbake would be a real improvement on what we
have today. But it doesn't get us to correct. Across both repos it is
still wrong on 15 blocks we can name, it has no opinion at all about
another 752, and 112 end up visibly wrong. Those 752 won't be right
regardless of which default we choose.

Assuming your proposal is to set bitbake as the default, then tag
everything else. That _sounds_ good:

                            untagged   bitbake   still need   % of
                              blocks               a tag      untagged
    ━━━━━━━━━━━━━━━━━━━━━━━  ━━━━━━━━  ━━━━━━━━  ━━━━━━━━━━  ━━━━━━━━━━
     yocto-docs                  1502       841         661        44%
    ─────────────────────────  ────────  ────────  ──────────  ──────────
     BitBake user manual          299       193         106        35%
    ─────────────────────────  ────────  ────────  ──────────  ──────────
     both                        1801      1034         767        43%


Under "default bitbake, mark the exceptions" we would still have to
explicitly tag 661 blocks in yocto-docs and 106 in the bitbake manual:
767 by hand. Tagging everything is 1801. So we are marking hundreds of
blocks either way. 43% is not an "exception".

Which leaves how each scheme fails when somebody forgets. With bitbake as
the default a missed block renders as bitbake - confidently and silently
wrong. With none as the default it renders plain: bare, but it doesn't
claim anything untrue. Given we're tagging hundreds of blocks regardless,
I'd rather the mistakes look unstyled than look wrong.

That matters more here than it would in most projects, because bitbake is
a genuinely bad language to guess mechanically. Shell sessions,
TEMPLATECONF= environment assignments and buildhistory output all share
bitbake's NAME = value shape, so they pick up variable-assignment
colouring without being bitbake at all. In a lot of places our snippets
look like console, or bash, or python - or maybe bitbake.

> > By default a non-specified block will cause pygments to guess. So if I'm
> 
> Sphinx explicitly states that Python will be tried and if there are
> highlights warnings, none will be used. c.f. https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#showing-code-examples
> 
> > looking at a lot of reST and seeing no tags, I'm going to assume the
> > authors have left pygments to guess. I would have to go looking in other
> > places to see if there's a default in place for non-specified code-block
> > tags, which I'm probably not going to think of doing, which will
> > sometimes probably cause more confusion before it becomes clear.
> > 
> 
> This is the Yocto/BitBake docs, we're documenting that project, which uses
> BitBake syntax. Would you want to write
> 
> .. code-block:: rust
> 
> for every code-block in the Rust documentation?

Yes.

First off, not all blocks are going to be rust, just as not all of ours
are bitbake:

                          Total blocks    BitBake    of all    of untagged
  ━━━━━━━━━━━━━━━━━━━━━  ━━━━━━━━━━━━━━  ━━━━━━━━━  ━━━━━━━━  ━━━━━━━━━━━━━
   yocto-docs                     1929        841       44%            56%
  ─────────────────────  ──────────────  ─────────  ────────  ─────────────
   BitBake user manual             334        193       58%            65%


You might also be suspicious of an LLM's ability to judge what language
a block is. So am I. So the classification isn't what the numbers rest
on: every block that got tagged was then fed to BitBake's own parser,
using the regexes out of ConfHandler and BBHandler, and anything the
parser rejected was re-examined. That's how a Makefile, three U-Boot FIT
source blocks, five Python unittest classes and five kernel .scc files
got caught and pulled back out of an earlier version of this series.
The counts above come from parsing the built HTML.

> > Maybe it's just me, but I prefer to see every example block using an
> > explicit code-block tag and specifying a language. That way the author's
> > intentions are unambiguous, and we have an expected output.
> > 
> 
> You won't be able to backport patches with
> 
> .. code-block:: bitbake
> 
> which is what I would like to avoid. But I'm not the one sending patches to
> the stable branches nor the maintainer(s) handling stable, so maybe I
> shouldn't care.

For everything going back to scarthgap, the auto-builder uses the same
tarball for building the docs, regardless of branch. Therefore backports
amongst everything from scarthgap to master would be fine, once that
tarball is updated.

For backports to branches earlier than scarthgap the AB doesn't use the
-W flag, so those would simply emit a warning and render the blocks
plain. I checked this against the actual pairing in the older tarball,
sphinx 5.1.1 with pygments 2.13.0:

	WARNING: Pygments lexer name 'bitbake' is not known
	build succeeded, 1 warning.

with the block rendering plain. So that's not breakage, it's plain
presentation.

And it's arguably better than what those branches show today. Of the 841
blocks this series tags as bitbake, 632 currently render *highlighted
as python* and only 209 render plain. So on an older branch a backport
would be trading incorrect highlighting for none, rather than losing
anything.


> > That's what I've enforced for our reST at work, and I've also
> > differentiated between "bash" (for actual shell programs) versus
> > "console" (for interactive work at a shell prompt, a shell most likely
> > to be bash).
> > 
> 
> We differentiate console and shell in these docs here too. If you're seeing
> one that is using the wrong lexer, please fix it.
> 
> Cheers,
> Quentin

