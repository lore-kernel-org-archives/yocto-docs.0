Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD44C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 09:34:06 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.86])
 by mx.groups.io with SMTP id smtpd.web12.9829.1638524045291253438
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 01:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=CGK4ibV8;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.0.86,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qpy406+vysceLLk113Rmt1unjOgDFzKIaUlBktGxoIVdgS7DsyuHrao1TgfM0Ms/DeAFAGIhyhd4vQawYru2bExpZAsVq4J40gdK0byok5Wqz0mAlWqNpmjbJj7/EKW621Z9uQcZi8dNo7Qjqdehv8EuUCvQ0JX3Cq5v1qRkzdpo/RtTlwhwqcOl9nspnfoe3c2JTjncr71kGXTmp4vUL3TRLmGSHxeRdUQrobyL43f14bT8kdFLpRyi74gxqYPbbyMYAWMnaMejHK43fmaRtkLIAsxWXKqNJkBy9c5Ln6CBemFO0SZAV9s4DdYYZju9NfmInuRTlyn1fpVz6a78hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo9YwqJHaL8hL1MR3iL7t4uaPwEN9V34JJS58IPtVDg=;
 b=CC6lncprk7plBDh9UrkDGXNEmWQY59PwaXrllYoxYbvK+WkQEtchI/UYX1hrB5M7jhiwQ2P+ALmpXDt8vuN2cLGVsN+cXZLlOnTACRki8auNT6H0FmHbeQbWoZmvgM93iQCuJI+Ae3yt/gtuOWR/L4eZokMSDdxW2G5JTnTPMJSsLuGfiVW7T1JiEtctWe1Gaf1433cezKcT/LpSoOIHyS/w69zyEPBIURI615iiXxt6i+YqFRKJxLT3fEzSni9LC/ZP4+jYNO15p1KUFw65cQj5Elwo3cT110mKSMj/KDsT7irzSx6nTeiEiBP/xWmQWOY/tLBTCmedYIBtgn8gJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo9YwqJHaL8hL1MR3iL7t4uaPwEN9V34JJS58IPtVDg=;
 b=CGK4ibV8k6wu3jzG2B6IyMUtIiW63C1je27r653GtzW8AuI/jNV2LXU2RuGMiCe4N0q9xmvl2qQmaRSuFiRSKzAeTC1BXCVg/+bEjkuWNIQiyzRtmbIJ3tpX+f7tFHpYljgaZNFdWzMnApcNo0/7laOM3p9JTLyOz2aLzJoc8Nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM0PR04MB7106.eurprd04.prod.outlook.com
 (2603:10a6:208:191::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 09:34:02 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::d56f:ec59:3bd0:6d7a%5]) with mapi id 15.20.4755.016; Fri, 3 Dec 2021
 09:34:02 +0000
Date: Fri, 3 Dec 2021 10:34:00 +0100
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: yocto@lists.yoctoproject.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 make all versions list releases known to master
Message-ID: <20211203093400.gzqddyn3vbrm256a@fedora>
References: <20211201134931.193455-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201134931.193455-1-michael.opdenacker@bootlin.com>
X-ClientProxiedBy: AM6PR10CA0047.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::24) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
MIME-Version: 1.0
Received: from fedora (92.42.140.82) by
 AM6PR10CA0047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::24) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Fri, 3 Dec 2021 09:34:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f368018-436d-483d-3e8e-08d9b6400ac1
X-MS-TrafficTypeDiagnostic: AM0PR04MB7106:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB7106D74C04A446FE94E6E99AC26A9@AM0PR04MB7106.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qovw+zPS4UXkjyjKWezXgp+NQw9cBb0rw1bpBI8veZuW6YuNqmnNmJ16YgGiYBzMpCqen55wudyM3CHQj2ttPGOb/HA5/kqcnIQ5dr+EnVfwg0O4cVoV4E0jYLLCZCPg85i9uESKZvdf7TGwCrEq79mLPKEcFtsLv5ZzjwN7wXdNsKMWrFPSUEZs8+uVFhICC8stVwJM18Rg1+eWEDgr2NRjBp3SDMSwnjNAsQGsKf/bapyRmw+2ixIHpHoZOEjruQd5S9NhEHNym2ef4TXEjrWuqNt6CI8Qc0yXuSH7wY68WCtR9U1Lk1RfLXZ8tiPmGbYQw4gpHHzXqVof/F6m3ircYx/Rfy0Kr6exOCUozJNNvevlE0ool35yR5LvLneMyWBrn7fDEl2jntaZetQb2gxndWoyUh5hRNg5d78mKBVA7o2Qmsu/sqFa3YXHBN3q+aaM4WHj9fRJ9fhDFMSQWhsyV0CrLEsHR2UgBzNDie0yxN5LUYBEJ7GrsjbJBnhe7RIK52eLO72Udb3x5WbLYQEvrqb//kfyNV81OuwRYF3FjM4CrDI9vAcBZ9YVmprzX5ukZV9lgUERpKsCCy4wqOy9SNKJMqh6gE5MY69z3E8PctLvsnVM52n5rAKXdWqAy1uoDdOPzeXslVB8gxTDBVgm3lQlIWP13S6O4OX2+yyLCT2BOXwpe37WzW1Jupa0sIaXIzlG8vHLqse1sRDZESo+EVxvJzd+NOm3mMq51U8NhNjDlm/tu/L46Kv4wuMNQrlmLtgFiFGqbo2pFrsPcVwAivwjKpOellmnbzLmCZg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(9576002)(38100700002)(66476007)(8676002)(956004)(66556008)(186003)(8936002)(66946007)(5660300002)(6916009)(86362001)(9686003)(1076003)(33716001)(55016003)(52116002)(2906002)(44832011)(966005)(26005)(508600001)(38350700002)(4326008)(6496006)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l+JgY6qn5E4zAbHAMqugoVlytnLXHe2yWiF69v1F6XbiJgm42TNjtZYrfZKy?=
 =?us-ascii?Q?B4ErbL0+tNWYx0OR4t0mLVC2ZXWPdksaf77NhxxoIJZs/XjUSpqv14yQi4OH?=
 =?us-ascii?Q?RpGe0yW7T2RSz7oyYdjLpk82aetBKd9HXNrer13rUVh/vVuMnRDuF6Y91W5G?=
 =?us-ascii?Q?X7ouP3DUxq3T9vMsUxDMHx3DjIo62WZ89zKVciYdXLfovfr3ui3cqcaXrxz0?=
 =?us-ascii?Q?CpfqKQTurEUMwfozMd5xzEPEBppnkY0FiATu+O2sBfac3uBoO2XobkqHgpwK?=
 =?us-ascii?Q?gCt91Wsfuc95BbEt0NolFA/xBnwxYZOLP705murGtYwYM5vcQvJJh6f++Gfx?=
 =?us-ascii?Q?ge/u7CfiRbwP6jIc8ploxub040o5jUawRsbY8hUsbJOxZxI0YVEpC/gRwVZk?=
 =?us-ascii?Q?bGYtngRRdMezvzIPt2zCnDvj0Tzmn0SwDWQNb1Qj54+Xm4mub1Sinb2OzXKc?=
 =?us-ascii?Q?B+QX0UUzlwetFzTA5mEcf9SyLvNFp22eOFUyrWHICKAsrxtfDyLgBRCVjdVg?=
 =?us-ascii?Q?ClksaSnrcMUlPkRTZynCqR3Gl7mXxyTyZ6Qa8y2qZ4hanNxpcxpYbKooil12?=
 =?us-ascii?Q?Db4X1Xos6QOkM384ijmylrKh7odxY9zxqhH8mTa5/vrEjwWO/UEM++0RqY8i?=
 =?us-ascii?Q?MWsrxagMc/8KXCq0jC4MTb/9s8hl3dFg2dfqmQy2SAwZ1yBD5GgBP5a2mY8w?=
 =?us-ascii?Q?VxYv/FyGAUKd1NjhoaNdVu6iIT8xBizv65WAMz1bbsuj0fLXrxTEI02eQan/?=
 =?us-ascii?Q?NNTti61+W9rZLgh+szHHsrZrKqHWvNMfnPkpvawGshEF+xxLw/sIOfeONEPh?=
 =?us-ascii?Q?+XbWRlhY/clrKCu54xU/dETZ3jFo82wwuBtULo2nDGOzkWqXth2MrOKQi7vk?=
 =?us-ascii?Q?nfhCwV3GrNFSDWRRJQ3lSeg+nfgvD6/p3ZLum0VeUXd5Y3/eftAaMickbary?=
 =?us-ascii?Q?4Iih3pieTd2s7OM8Aim/9ESr0yQwQ9rOZ8g9u1Jl6mXWoTzeq8cW3dTOUVie?=
 =?us-ascii?Q?bnGDv0W5UK7YIxzKX/fcn28xUZsYCOxVi34xOztofu/Q+eCSMYnl6Cggw5Ny?=
 =?us-ascii?Q?O/iicDxmyPc+lPd7MJ/c6U3iVPcLoZhULQt5O3SrbdYV5SADwbhVDKkTUEOt?=
 =?us-ascii?Q?Xae5z80fOVBDVsAv94B8b6okeEUPCZjkWjRjmr5lWFcBKojKVCEccyWFa00W?=
 =?us-ascii?Q?YHOOZ4/W36rsePnuxUwy5MwvffWdNK9zBozlnDim39mqLQ2jvCLscD/sJu/U?=
 =?us-ascii?Q?JqNc0hUBW/Zkw+Jcn+dfpHlAlvuo4XqL53yrxRrv61UX56P+TTWkVg8mjeOm?=
 =?us-ascii?Q?3i66BWoOUhEDZ1t7PI9GH/rFAaaFFS9jzLAbWDH5hgdlsaL4OEGRKdPYO4w4?=
 =?us-ascii?Q?V75GXXwM6Pn0TUUgDfOLgiKzEsr8MRBYpx90VwJyDRVihGQtviJ7mKj0ICIJ?=
 =?us-ascii?Q?a3cEV8+UHvMEZspGlvgYzH89iMF8Ll3ilC+j09Ha6OQgULSvYY/WwF8EpTmt?=
 =?us-ascii?Q?QHnOvP5OtseSitexd73hm0NGz7gJvJVQB9Kvv9fDM0cU4YGLAXL71s37G419?=
 =?us-ascii?Q?43s1LQjW18AAZPNABB9Qy0lLFnZr/DIGNOfLSruYd/hieEj0iD2c92B5oIwW?=
 =?us-ascii?Q?EffuCjWzwbkiLhNioaabU7Gh3oYmAiLxb2a/dM1Y4YwXi7mIlYR8W1hna1Tf?=
 =?us-ascii?Q?QjsgxFA0XKUTY537aI+5eFhTlANixt/PNHIJ2tcwWpm+f1dWL5aeQDIOcY5k?=
 =?us-ascii?Q?3UhetGdFgg=3D=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7f368018-436d-483d-3e8e-08d9b6400ac1
X-MS-Exchange-CrossTenant-AuthSource: 
 AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:34:02.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hxzWfiTEdFFq/mJqcyV6KIV77aVeFuOe7Kkhrpdik8bBNux8+unE1q5yVbVXDAu9d7ygkm6Yo/8X85K/7pAjiOH2BXgXb+o7g61iOymcxLH5JnJdigfLEJu/tZMGcLe0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7106
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Dec 2021 09:34:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2214

Hi Michael,

On Wed, Dec 01, 2021 at 02:49:31PM +0100, Michael Opdenacker wrote:
> This allows all versions of Bitbake and Yocto Project manuals
> to see the manuals for the latest versions.
> 
> This also simplifies the release process, not having to update the
> releases.rst file for all releases every time a new release is made.
> 
> Note that such synchronization is already done for the
> switchers.js file (but in a different way). This way, advertised
> releases are in sync with switchers.js.
> 

Why don't we migrate this different method (find) to the one you
implement in this commit too?

I could see a variable storing all "force-latest" files or someting like
that to make it obvious why they have a specific handling.

> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  scripts/run-docs-build | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/run-docs-build b/scripts/run-docs-build
> index 4451018..5d6d24a 100755
> --- a/scripts/run-docs-build
> +++ b/scripts/run-docs-build
> @@ -39,8 +39,11 @@ cp -r ./_build/final/* $outputdir/bitbake/next
>  # A decision was made to keep updating all the Sphinx generated docs for the moment,
>  # even the ones corresponding to no longer supported releases
>  # https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.yoctoproject.org_g_docs_message_2193&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=41QznJ3f-1jbT6A1N9c2-XE7vAUbnla1A6cM0yaU8thgWg_WVfeII9dfe8Uq2JTO&s=YCQsQAquPWLLWl11yDzvgP9zkF-UkMF0c8B3BASBDbk&e= 
> +# We copy the releases.rst file from master so that all versions of the docs
> +# see the latest releases.
>  for branch in 1.46 1.48 1.50 1.52; do
>      git checkout $branch
> +    git checkout master doc/releases.rst

That's one way to do it, not sure this is really what we want but at
least it lowers the maintenance burden so it's a good improvement.

Cheers,
Quentin

