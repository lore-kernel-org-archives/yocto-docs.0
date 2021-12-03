Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20FCC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 10:51:57 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.72])
 by mx.groups.io with SMTP id smtpd.web09.10044.1638528715863337666
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 02:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=TjCMiru1;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.72,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/8KobgMmB/T7KN5PBF7Zo4lDNq5BN9g+aMy1nV4FRdP2zK65e+4F/+mo2kUdhLMM8Vrer3JAOdO0P19CrpYjotG6WlAUCEUt2/1r9USsLLfEoFuFu5r6IwpAi5bMh4GknUF/eKLKq3+KI48QOUA/KGqG+0WCGEjR5q3xjnclakZRIhR9/hOVvAdlWO1txfW7JMOKellTrU8hMlwSDBMH3xeJogUBvWCrWInGReVMij0v3xcUjB3plZDu+GiIMjL1yuT1yhOOhXg29K6GnIgjhGvkIa9540v2Iv0rIJfFN8ZHjEcPWRmh14gua8QFGwDTt3L4nXGehQCOh7s13PiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFExC9peWrkgo7GmDzxcLJXdtypZHFV+apj4q/9L+qE=;
 b=KqltMKkR0eLgmpOdgBxKlVj26IMU28Qgh33Otw5nmS1ZoDZ0x0Wh1Y83RQokdfcm5wjhyeL4u9Betb5C//nnmKjyphGYC+ZNPSPSos6OIT0wH+Q7CPtBPVOTgP00YvV6ChY4/eEBGhnHGa6lzPgg6QC17C98e2BBDOiTTxVjWbgnmBAygKVgTd5XOvlXP/PXO2MpQ5fx+B/VMZQp/BtBm2fhiiBZptxFh7qyIZPh6KbJtQ+4xfKBCdinovg/u8+2wTpYJBiu6h55uqFUJHfVH+sN48NhbThO4jx2TplTnyJGdtK82LGmpjwna7Jh2Im4ggGk1BxCKPp4Zu+eBhqlrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFExC9peWrkgo7GmDzxcLJXdtypZHFV+apj4q/9L+qE=;
 b=TjCMiru1BJE2ukItOsQTCpORl/k5x3fI+c70lJMqINtt4ScnpybJJA/ZpQnwDp4e+LXxvBk4ZZCqGikORFld8oe2KXw4K+edkx4EO18ZN9IV2IuO3RgtXDet7YR+aeW6ruqIyFXj2sxjcHXTliaOYbumkkLr7JKUG9j55mFgI6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7764.eurprd04.prod.outlook.com
 (2603:10a6:20b:244::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 10:51:53 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.016; Fri, 3 Dec 2021
 10:51:53 +0000
Date: Fri, 3 Dec 2021 11:51:51 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	yocto@lists.yoctoproject.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 stop using the "transition" branch
Message-ID: <20211203105151.3hez2atqxq3ye63h@fedora>
References: <20211201135949.193842-1-michael.opdenacker@bootlin.com>
 <20211203093452.sk3e6ksnwmsbnjn2@fedora>
 <CAP71WjwoVHYOvLSKkW+fSSO2T5MupA-vEt1_cDfwdMjy8ZhP0g@mail.gmail.com>
 <20211203100259.54n7h7ghlqfr5tia@fedora>
 <CAP71Wjxp04oP_YXX-em4OhRAvbjztATUEy9fozZ4+ves7NvVTw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAP71Wjxp04oP_YXX-em4OhRAvbjztATUEy9fozZ4+ves7NvVTw@mail.gmail.com>
X-ClientProxiedBy: AS8P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::29) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by AS8P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 10:51:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2724e46c-abac-48b9-463b-08d9b64aea96
X-MS-TrafficTypeDiagnostic: AM8PR04MB7764:
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB776403BA967C3140D6CDE8B7C26A9@AM8PR04MB7764.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6Wkv6CKyAA0PBz9zVNwoAEAiX9BY+zuInRoiFrTxA7abNPyNoisFlaO8L2pcbVBi1LnKVd87zFyzSG/cE+7IYraYaDvn1IqwW4jvstA/5Q6N5b9/kCJn/E2iv+/C2dStwNzqTTED0HA9ZLZDvPHJj4oig0zAy+NZDbdedU/eTG+zIZMD/2Ok7u8AEkhq7BgfOCylzCjQrIX5do9Q+8dkZ1Lk+0/KH7UyXjM06ZsmoLRPxN8cQOHnO1j244TiXmMUMOSekMtLje9wauDat2leH2mDvFkft/B5jPoWfQ3hf15MET6ei63Xf35jF6cpDNAJ4ZBkEdf/bfELkeLegt6386H+dZfTdoEiGY/VkaK8II01fLy2f06t4BkdB7cD2OAEwfNdfz88pcXHLT2zInSMUuv54R/7+kfjftAgTJNX0Bw2KsIwaWLwYXeBHzWFsrM/u+iCfYGHnmAmR9DCvIyNvGf82/ErkvR/PLJzecdpvKADxkjNd52LyfSkeAIB/kMM2kWlItnPfU1hsG/Lt1aRbHEPNFSBxS17QJtFGs7QtwUHeE/5LwuNoZY9xmB7oZz2Yw7gNSm1DHAxnIFJ3TrXVgSug02VVBmeTFZUv4tMyv76aA/a+J3psaN74rUlMU8EXe//gFPxXg+xSKX9Jsuou2mMWcWmP2F7ehrjJAUGr1mh+Lb6hyKeu5WRyJ/eQgV1Z7xfgmbQrGV7eD/CRvr5pxVn0TfZAb9nB31JQsQ2W6wR2yYNZOvCr7qrSGLqay9PdVVtK4ZA9rq2A7YXVjXz1tusMVap5QA0c7E/XeW7wVc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(33716001)(6496006)(26005)(38100700002)(186003)(44832011)(9686003)(4326008)(2906002)(508600001)(52116002)(38350700002)(55016003)(966005)(66946007)(6916009)(66556008)(1076003)(53546011)(86362001)(8936002)(66476007)(316002)(8676002)(9576002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?myFazv+K7Wg/5TWm9Yo9V5E0bx3Vygk4EdIrSjy+9n+hda/rqHlK8pKpMARj?=
 =?us-ascii?Q?d9lp1pvLJiDR9JO9cVMX9lxN+JwMXbtqzT+sHCd2HIqoqQFImRDA57boItXK?=
 =?us-ascii?Q?pV3uewmU5k3NslLmwHSPm50CPby3noK2IM2TQITWjDlRqDekeUnEm2i/Fn/U?=
 =?us-ascii?Q?cFdzgK0wCmE9GaEUMmxJYm99F9L5R6N5yWrh23+laKpt3o/3KSJ/lc/290Er?=
 =?us-ascii?Q?SUV285/uTuGCF+LJHd40NWVprioOXTU5QiOpmCuzkdCAbBYJnY9yPH2FKDC0?=
 =?us-ascii?Q?jvFTKJNEyoC0hhlfHNUjU349I1ECi3u6CxoDdjGjvk7K3a/x+L7b1coI5zEw?=
 =?us-ascii?Q?dKmzyj5p6fgh4ZPWIBxkIfzyMFlTBUuTEt5myyrSD+gIbhc7bAPBI4/+RCN9?=
 =?us-ascii?Q?hXpfSifTIv2YeREvrKsy5+oUkWIHBlc21QBp0d7d7QBdBwh+r38ETiJ4mi1X?=
 =?us-ascii?Q?nhxyQeTrNPNemsivi4nMus+wO4ySPj4LsmgQwyAue/3xp1+Xx+a1lmu/sZ57?=
 =?us-ascii?Q?UkeUYACF0Oq7UfTBpT2lrD/Ot8ki+gKqoLSEfp8d6G2/ah2TpII7RvCCiENH?=
 =?us-ascii?Q?9xt4r1Ump2BeaUWDADqkhZDj+Ely8YKmovAD3ZqE8j1lvVsyquxMpyA/wVf+?=
 =?us-ascii?Q?laAxUW0gPtvE2QQ143sGPCikQYnKnr01Zt6R7y6UnUtjtvMgpLmrNWx6oLrb?=
 =?us-ascii?Q?ZXiaxayueITJTlf36JQT0BZJssQNTEPBsmb8AzZYD80uRjDLxE1+LshE+XXS?=
 =?us-ascii?Q?Egs2k7hBKqW8DJIBwRY4bQjnHWGMSi7+vCoJVJzP7lcIaf7Uq81bfLxLZFvs?=
 =?us-ascii?Q?yYp9p0Pfa9gu357cqbQiP2UncG14qg3uj+ZFtTHN4m4DmWzYV7vWpu7d/kH3?=
 =?us-ascii?Q?2NkI3M4qTB9luzByGQYm/ZSFixons42hTamE7R+EMhMTCTZFXIFloOb4cRnG?=
 =?us-ascii?Q?gwccRYvv6aP8i0v/a4aGsgFcqt+wOvPkJvycWR6U9FlkUU1ATiq8QaKpoKr0?=
 =?us-ascii?Q?g79IrGgB4CSNujrB/26u37mxpnOjKyJVpxz4nXC2aL4EdIy8Q6B15J0WxW/W?=
 =?us-ascii?Q?+qKr+7iD7Jibr9V+n1lfTOwjNu2HhHVvivd8K5hp3xgjfvqxpbw1nxpjC/nF?=
 =?us-ascii?Q?HcKpuFY5Yhz34qIwPShDT21HPHIZ53NhXRJxkQxyPKJf8KtqJ8HVLZuIWQGr?=
 =?us-ascii?Q?wCum6PI2SwmxvMxURYfJhQfjdx6N+Qw03M1MxuElknhzWcKM/K0ZX5Rc+K3D?=
 =?us-ascii?Q?re5qcXwnhwYI97PFPKi8g+w+W4eEoznG9uxy60RJFS6po47/6FrVy0V0G0IF?=
 =?us-ascii?Q?FN2iNuMCQgqzDcwm6iwUCEjpMB5EsMecHYUnnZWuUbiLHNeLssEOjPXNRoX6?=
 =?us-ascii?Q?yTtQ3Jb/L60J5D5P6RJmgqUTkgaLrZwjdQUHDDWEO+rjyyY0XqwWe85Lx5e9?=
 =?us-ascii?Q?WW07+LGQdOJpIkR9WYkj9epLofdqILAVSEDaaDrSQaRcnBcLKaTzOZ4WsLQG?=
 =?us-ascii?Q?YKqVpoaASRt2hKLvrWD0FMDYLIZG/4NJ5Yz4Q+Fk3G8+BIY6pJF5hD592ihi?=
 =?us-ascii?Q?Z/3UDY48dWyWdA2GWf+fgdLkkr98NwtiUBGFUmOsJANCh5DHeKyMgaTczhfC?=
 =?us-ascii?Q?7qE+qowf1Ogl7XhvGRq998V0Zv0vz3Z8vipjAJDIT6s48wftqqMLb2o+Bwlg?=
 =?us-ascii?Q?XGOJWSoo1FZtOLQHMNCvFmut3bLEBKi7MjMYBrddurNuBaRg5T4k4GuSBku1?=
 =?us-ascii?Q?7XfDlih//g=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2724e46c-abac-48b9-463b-08d9b64aea96
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 10:51:53.0027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dTM7J6XobZRFiL2hJzzt/T82XRKXsiEPrR6x39+Tg4gMGCaSrvo7ILyfAF2vbXyjg/EeKGG1mPifGqcKD9bK6/b0pn6X4oJzc6cZJBMxZcD87lMBYsqyQWCE7Sy7fuia
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7764
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Dec 2021 10:51:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2222

On Fri, Dec 03, 2021 at 11:48:29AM +0100, Nicolas Dechesne wrote:
> On Fri, Dec 3, 2021 at 11:03 AM Quentin Schulz <
> quentin.schulz@theobroma-systems.com> wrote:
> 
> > Hi Nicolas,
> >
> > On Fri, Dec 03, 2021 at 10:49:40AM +0100, Nicolas Dechesne wrote:
> > > On Fri, Dec 3, 2021 at 10:34 AM Quentin Schulz <
> > > quentin.schulz@theobroma-systems.com> wrote:
> > >
> > > > On Wed, Dec 01, 2021 at 02:59:49PM +0100, Michael Opdenacker wrote:
> > > > > No longer necessary now that the transition from DocBook to Sphinx is
> > > > over
> > > > >
> > > > > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > >
> > > > Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
> > > >
> > >
> > > I don't understand. With this change, we no longer build the pages we
> > > reference here:
> > >
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_releases.html-23outdated-2Drelease-2Dmanuals&d=DwIBaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=nyCl21erajBNcx6SkCKI_BEntNgbh6114vcdWp_vB5yDzorVFjmzdqp0WXIIpQyK&s=rw5wG0nk_9KQ8RLvE1-sbSicy4NslWaeMwoyTSUuIyY&e=
> > >
> > > Or am I missing here?
> > >
> >
> > Indeed. But this should be fixed, because we should handle this the same
> > way documentation/releases.html is, with a common one across all
> > releases. With the current implementation, only master has a list of all
> > outdated releases. e.g.
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_3.3_releases.html-23outdated-2Drelease-2Dmanuals&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=0ATdi4CSdy8VvhAKg6W6Qe5J7HEmGOLkDTVb13pe2bQyCiXzZxZGI_ePuUigui73&s=sW9qt9Z46xCwvoaxsU7RvUYqfKmOlSN8T_vDv0Yc_qE&e= 
> > does not exist, but
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__docs.yoctoproject.org_releases.html-23outdated-2Drelease-2Dmanuals&d=DwIFaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=0ATdi4CSdy8VvhAKg6W6Qe5J7HEmGOLkDTVb13pe2bQyCiXzZxZGI_ePuUigui73&s=vI9nhu-xEodig5uSD7RDYKswiZHG_8PDgnd2No0oXMA&e= 
> > does (and weirdly enough 3.4 too).
> >
> 
> Yes, this part is indeed poorly implemented. But I don't think we can
> remove the transition branch until we fix it, so I don't think we can take
> this patch now.
> 

Agreed, I poorly reviewed it. Thanks for stoping us before the disaster
:)

> perhaps we should maintain the overall documentation (for all versions) in
> the same branch.. all these branches are making everything much
> complicated.. Or perhaps we should split the documentation 'content' and
> the documentation config and scripts. I am wondering how other projects are
> doing it to support such complex doc setup (multiple versions to support
> and to publish)!
> 

I think all our issues always come down to this weird and inefficient
organization we have for docs and common files between doc releases.
We'll need to settle on something one day because I don't think what
we're doing today is working :/

Cheers,
Quentin

