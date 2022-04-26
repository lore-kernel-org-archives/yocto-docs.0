Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3BDC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 08:29:43 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.82])
 by mx.groups.io with SMTP id smtpd.web09.3821.1650961774596481060
 for <docs@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 01:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=F9AqByky;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.7.82,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnhkmkMH7nz27PzPSWvCwOHrRAOwlWiRUVFE29ck9YcdRhuBoBNoj6UHCO8fNyuoCHhfGV6VO3cmQw+n/4xrOs4PCCxlQPwp6fRClQGfB4q1d35CmHrQIPUw8J9ZjyLpNzie8Ayg4/S5knDzizpnd3udT6mOFRfTieEGqnF1jmtimueR/r0qia9RYmGCKkgQ8kqd5MPMc0zBPPlWyJjAWkKmEenIsN3LA8yA8u4BCgEYfWfhk1UdC/reTKZLZKdqw5gtAV8d/wyDCTcdCsQmeP8hEhldhEUH/AFPuqGi1Uc9y/tl1uFJcLut1B4tO5qywRs1AKu6sYoh/FC9guww5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuGVkAcnD832J5NaBMQQ0EUVLIjxTyUQYnxs6jjrAvY=;
 b=TV+zwXGhGqtqPKFVw9SEJBt25vaGXkkkvdKaAAVv0X6++/iqhh7F15Y6H/UKX9PMA7CQPaEnRnULdsNlZoA4Ky1lcT3WeJ1sTZnNyKTx6Jfar1WerqYzDAtPkTiDs0koeG9PSZrlR748JN1FmBtzc7KAm7H1pYvPKBydgjbGg0h36t7931fiHVSvq2R/02A4FltdZSzqvQj6zE1UVQJjfEEFpBKOrX5dfEd7MMY/FFv8fvsYtaOKD1dEFj87uHcb5yVoXC7HqCWy0gfJY1FfUlnwo14sStyAMMlpdMBkMdmTxpCbersuOMlYUPqHVfdZilzZML52PKG6fkGY5IVYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuGVkAcnD832J5NaBMQQ0EUVLIjxTyUQYnxs6jjrAvY=;
 b=F9AqBykyFBOTD3h7UGwowcn9BlA4obxkS6GF0T3EsXfNoXbhCxhpPUjG1zw4lB4Xz8OxTe6sWK7undaymmCe975x6EAOmMNo1s4Z9rt5E9f4WPUoWuFcPYIF2CgSjQ2KJeDN9BHCQVOlb4/VD141q4DajTkqGn7RFX4E+Ka98cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM7PR04MB6918.eurprd04.prod.outlook.com (2603:10a6:20b:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 08:29:30 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Tue, 26 Apr 2022
 08:29:30 +0000
Message-ID: <2c4f3f90-25fb-6e3b-dae6-466bf0e5e40b@theobroma-systems.com>
Date: Tue, 26 Apr 2022 10:29:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH] overview-manual: fix and improve links to MIT and
 GPL licenses
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20220425171055.111005-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220425171055.111005-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0190.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::12) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e8f2c62-1d34-4dbe-e147-08da275ee207
X-MS-TrafficTypeDiagnostic: AM7PR04MB6918:EE_
X-Microsoft-Antispam-PRVS: 
	<AM7PR04MB6918FB6142119007B31039E8C2FB9@AM7PR04MB6918.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NmxCwkBwy+OtEsOt3F+3606b1j1U2rm30JWaUSlBl7UUk/3wAs9FPun/kLiGoCrU0KBP9k+wkZ+XAoylS5D1DaYl2Yhuk6asIYqXzzfRdHiSjfAKpT5BnwyNenKhkr13ZGiYgpU8O8zCUwiSYhf04FQ7d+PgM70WeavCwZCUf30q5NhNlXu0u+FRt58dp50wDyIA7m3Y+C6m9oqDCZb4UReL60J4OrAzBPJ7Fj0/qdcab+E1CnERVZkUEYXcMv3TAfXHC0/9HvcRA2NfTQIQCegq47pXSTjD0xjCR1QA/YMpVTmiasJX+2xRIxya3iABQ2MaKVdx4EmIZQAzJakIwp2OmWJiS5lBotWQwR5NbsucU7hTrpo0Kqn2P2sgEODXRpg+eX1i2oqev75PMBrBcge5J32mPwXosFIE/FWmbMsyz7wpKAOh2Tzzowwk8Z7ivJZngd+NytAyAD8Ww4JrnW/O+qJv6UZ/PZknwV6oh88Z10dDwiGuf8KSwK7w/drWEnb+XPpUtEr/n99BwgKRlXjl80ldLyPg8N5BdpR/0NHOt4hy5CjOpLE8a7+zxnmxNcgJmLaPokaZjcioWud0Vwpnrc2/uND8NX7NWxWdZ/ubHCZmJ3D6p4vz5tkBNzr6qRw1jtLQ59PsiyAxg1pm9UmuMGSzMJ6LDmIg019dmptaXXxyWKFDOHCCeiHb9CQzc7W7JdreulJqIGIGYoHsc0LiI9G2b6c1AD837YhuIRhfi1nAbTtCypj+3XUKL72FlDeJr64NJVkds2dL3t2Z1kiqEqW1apOjeaej+Hv46vx7dG8cowp/vQW2DC5txkR9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(66946007)(26005)(66556008)(6512007)(8936002)(6506007)(316002)(5660300002)(66476007)(966005)(6486002)(31696002)(38100700002)(508600001)(86362001)(8676002)(16799955002)(2616005)(186003)(83380400001)(36756003)(44832011)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUwyL3pMVThrVGVSZlVCTTJMcjd6Y1ZpODhWdXVQMVZUWUlEVGlZVmIvWVRQ?=
 =?utf-8?B?ck1BbXZtSjB1SEpWNTFSUTIrNTdDYVJGRFl2c2JNQ3ZXdVBDMFZCd0dRRWFM?=
 =?utf-8?B?Z0l5YjlleHNuTTVMeHhVOFprai9mY2dxd3l5UGcvNW9mamxPWjFONXJSTDFt?=
 =?utf-8?B?UFFEeDhRbGtkWUI3S0wzRVhkRDEreTE1QVRLTUJSd1hyWlM2cmFwcVllb2hQ?=
 =?utf-8?B?ZzdyeTY3bmVLSitjSTAzQ0lhMGpiK21abTR6MW5FOFNUUEVyWU50c1N1ZlhM?=
 =?utf-8?B?Wk83TkRvTVVaMjMrVlBHSXVIdnRFQmNhWi9LL2RUdjJ1Y09RZXdtMFhYV2R0?=
 =?utf-8?B?UEl1Nk0wRkRkazlvbGdGdk5BTHgzeEZvY2o0eWlrR2I5VGVwQUFvQTZhNGlQ?=
 =?utf-8?B?UWEzY2t0ak1SSnJOa1FkWFVPQ2xSMGdndEtZdHpvbEY4bVVoK1poNXhDTTJG?=
 =?utf-8?B?dmd4YVVQUHhCWVZiU05zWUp4VGFJOU5ONEhFWFFiNVZIUVFvY1QvSTJjeG5k?=
 =?utf-8?B?SW04R0pzV1UrcCtVejIxVmdVMU9iTzBtR25aM3lza3BveXdtOXBIdzdxZTNX?=
 =?utf-8?B?SkZrcHRJTlg5WWYxTlhjRTZpTWsrUHNIMVBGeTdINms5VUltWjRVWitOenNB?=
 =?utf-8?B?S1U3TXd5Z2N5NU9EVzdqL09IYS9WVHlHTEEzZVFmMklCeklBeWtGVXpqNWM0?=
 =?utf-8?B?RlJZWFVBZGZVbXFvMVkzWG01ZDQxcGZIS3R1U1I5R1FBOGIrd2RsQ1RjaTgz?=
 =?utf-8?B?WWdZYm44QnF0UHdoTE80QjgwUXdFMUtFeTkzUlRGVWhzUDJvREc4bTlFSjFH?=
 =?utf-8?B?SGMxQXZ6NG1YYzZDZHMrakdReUNVOFBNeEhjcUM5bnZEbWRCdGJmRUJHaEQy?=
 =?utf-8?B?enVLQUtPb05LN0lQbW9sL1hlV1czMk13akE0ZXN4bGlCanMzZGRyWEZmcEps?=
 =?utf-8?B?YnVSY0h6STRUcjltRmQyTDNWakRRZjFxNWtDczI3Rzl2ZW83SVcya0Y1MVBn?=
 =?utf-8?B?V0c3dzA0Q2tLaVgrZEJMbnZJOExneWE3Q1VScEFrTU9ZRmNUSlM2Q1dEZEFI?=
 =?utf-8?B?ejNWS1BNU3A5ZjRhL0N2NGk1ZXdCUmEyYnpVOU1nNVJ5eERKRUtJM291WUFy?=
 =?utf-8?B?WnNQbllveGdjVk8wMU9EWDRkMFdYOTZrdVQxc0hhVk95VUpIdjVYdnVid3d3?=
 =?utf-8?B?N1A1OGNNMjMvSFp2VGZwYTRNVlFaT282eXZsKzducFU0MlIxTENDWWg1K3Qx?=
 =?utf-8?B?VDB1Rnk4WUtyN2JpVTE2U3BURElNOEtEYnRNa3FxTWpmajBhVnIxL1lrNXky?=
 =?utf-8?B?T1dMQk01QTluTE9aK1NhVTJSZnY1dWpaRWtGM21VNWJzUHFtNms0N0NFYnU1?=
 =?utf-8?B?d1Y5bzNtc0FkcDhTUVk2L3FRaU9ydTBhN3VuSnpiOFF3UnNFV0d1QXJHenVN?=
 =?utf-8?B?MWF2dHpFK1VLVU5DTllZL3pVT3hPbmZJYWNDL1VQeGhzSzFMSDBhOExuejZQ?=
 =?utf-8?B?RWh4bjA4S3JJc0xZamFDV0RRQ3pvUHdCZzUzZlpIZjRZR2JoTVY1dC9qRk5D?=
 =?utf-8?B?S0UzSWxZMFlTWmFVd2p6S2Y0SnJGL1d1SmxQVWpNN3dpK0dBSWVHMUtwZTFX?=
 =?utf-8?B?dkRsWXFpR2hhSnlMYW1VYzZmQlNqU0F4STVib1pkSTBhQlZpNUlQZVlMMFBM?=
 =?utf-8?B?RUE1eW9yNitjM1pUOWFDb3ZMVjlpWG83cFB6b0dHWVphOVByZUlWQU1salJP?=
 =?utf-8?B?cEJaSUxlbWZPNEVWcDB0TjRua1BSdjdCUUllK2V3RzNEbWkwN2lZcG5rT0dj?=
 =?utf-8?B?UjVmRWlxNWxEMjdNM2xmUzhvZlRYRzJCakxPeENHZUlxcS9yeDZOT1FnTHY1?=
 =?utf-8?B?NDlLSWpjOHhsZXhmNG1NY003R1FDK2RZUmtWZkdQaDdRNWNCaVZyaXc5Y3pX?=
 =?utf-8?B?QXhuZW0rS0hUK1pVY25udUhoUGlVT3FySnNrSTFrR29rU3FyaXdpNi9reHRV?=
 =?utf-8?B?RjdtdzZkVGltOTZPdU1heFNLL3E4VlVINHg1eDI4Njg2NUNndGNyK05LT2Zl?=
 =?utf-8?B?cUZFYk1MQldGMWdjVGlKTFdaa1E3SWl1WUJMRysra3lHQWxiVThmdVFxVE14?=
 =?utf-8?B?dDBpMHRHRzIvZTFsR2JZQUh3KzcrRUJkTTgvYWFVTHNGTmhEUGVFRktpMWJa?=
 =?utf-8?B?akZjVS9URmJjMVJzTnhIU0dtV2NMbTl0YUszR2ZzaDAwei9oT1NYMGNqVkFt?=
 =?utf-8?B?eEhUVFhLYlg4SUN2eFUzdmUwSzQ0NDBiaWJXSmRXb2tKTmZiMExQUHVQaVM0?=
 =?utf-8?B?STZ1THRZMW4rVitTQktHZ2NjODFuYmd5RTBWRHNuYkg0L2lvYnFnckJHemJw?=
 =?utf-8?Q?d2Fn2JSmqt7wXtT8yCb2LgX+8i3ErVju5ITmM?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e8f2c62-1d34-4dbe-e147-08da275ee207
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 08:29:30.0016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fnqyo0LJeEFKAa8snUfJ8gaFo/AwOL3FHvkDFXHIf3HNyzhfZvAWLnlzmPraGRye8FKiTUNQk7xP08cIpKu4FMujPrK/VCOcCUi5yeh8SIwcaCRtZPWGbHRSun/1UjgZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6918
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 26 Apr 2022 08:29:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2863

Hi Michael,

On 4/25/22 19:10, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> - The GPL license link was wrong (pointing to the LGPL)
> - Using Wikipedia pages instead of the ones on opensource.org
>    as they are much more informative and give the normal SPDX
>    license identifiers that we use, instead of the short ones.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>   documentation/overview-manual/development-environment.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/documentation/overview-manual/development-environment.rst b/documentation/overview-manual/development-environment.rst
> index 19095fc116..e1572afc75 100644
> --- a/documentation/overview-manual/development-environment.rst
> +++ b/documentation/overview-manual/development-environment.rst
> @@ -620,9 +620,9 @@ license is distributed with that software. MIT is also compatible with
>   the GNU General Public License (GPL). Patches to the Yocto Project

I'm not sure "GPL license" is precise enough. Also, who said MIT is 
compatible with GPL? We don't have this authority and shouldn't be 
giving legal advice. However, we could point to:
https://www.gnu.org/licenses/license-list.html#GPLCompatibleLicenses
which lists the Expat and X11 Licenses (~MIT) as compatible with GPL

We could probably say compatible with GPL license*s*.

>   follow the upstream licensing scheme. You can find information on the
>   MIT license
> -`here <https://urldefense.proofpoint.com/v2/url?u=https-3A__www.opensource.org_licenses_mit-2Dlicense.php&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=TicWvGiYNw0nULWTc5mxUoiBdqZwJ1Rj2Bw9SV3obzQZsFXC9ILPPiZM5dFUaK5N&s=zRY_pZJNQ375-UrrwwW4BMqiy7i5g5H2o1TIz17mvpM&e= >`__. You can
> -find information on the GNU GPL
> -`here <https://urldefense.proofpoint.com/v2/url?u=https-3A__www.opensource.org_licenses_LGPL-2D3.0&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=TicWvGiYNw0nULWTc5mxUoiBdqZwJ1Rj2Bw9SV3obzQZsFXC9ILPPiZM5dFUaK5N&s=HH0RDJd36GiqPZNmcQSp63LVNdUmgRvWGHpiA31Nh2U&e= >`__.
> +`here <https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_MIT-5FLicense&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=TicWvGiYNw0nULWTc5mxUoiBdqZwJ1Rj2Bw9SV3obzQZsFXC9ILPPiZM5dFUaK5N&s=a43ljijovG3lq_QtCp4_LXxcK_Pd0AiB6Fikq3Au-dE&e= >`__.
> +You can find information on the GNU GPL
> +`here <https://urldefense.proofpoint.com/v2/url?u=https-3A__en.wikipedia.org_wiki_GNU-5FGeneral-5FPublic-5FLicense&d=DwIDAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=TicWvGiYNw0nULWTc5mxUoiBdqZwJ1Rj2Bw9SV3obzQZsFXC9ILPPiZM5dFUaK5N&s=Id0NEiNB9EQog5SKyrbZwXHB-DuzkLTqodlJOinvFAA&e= >`__.
>   

I would rather point to:
https://spdx.org/licenses/MIT.html
and
...
well.. probably
https://spdx.org/licenses/GPL-2.0-only.html
https://spdx.org/licenses/GPL-2.0-or-later.html
https://spdx.org/licenses/GPL-3.0-only.html
https://spdx.org/licenses/GPL-3.0-or-later.html
? (there's also GPL-1.0-only and GPL-1.0-or-later but I'm not sure it's 
worth mentioning considering I have yet to see many projects using that one?

Which are giving the actual content of the license, without any 
interpretation which should be left to lawyers to figure out?

Cheers,
Quentin

