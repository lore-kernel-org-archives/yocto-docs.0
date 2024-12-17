Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88BCE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:05:37 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.61])
 by mx.groups.io with SMTP id smtpd.web11.79219.1734433528935713966
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 03:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=WjwzGk3/;
 spf=pass (domain: cherry.de, ip: 52.101.70.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTqRmYnFeeuCLlEO9Y6Y3pfaaNkxfnPQozR2hsWGsKgaER+i0YTK5F2NiL89MUBRl5CuqqOwLZCXBzQ6b57vr/zLZr54k9Eslt+emZiRS1Dhr/+dZBMWeyQD5lhae/XFZtaCoGBDI3mO50RDNc5MBICJmlqNhUtvIxRopkDUDbfsE1l9haLvqAo3Ih1F6cdrd7P8iaxKCqbYCC7gJeoNfRMrE9OiBzwoLSpXMXV5KjBSptq+kfT+40Mqjiq+O+zRE2xWzsHSIqmMVsV8YRH1r6ewuMA9QdtsLoWZYWMmdv+ZZJKOoisFULPmPm7+xJ/qbTp4ZRN8PDXrQh+ua79mLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tp+mKk19EKL6PRm5jtSnTYEdjTxNeLaKGg1SBXQL5EA=;
 b=Nj5ivx7Qa/irEimjfoeKAcHTd6MkMxhY8aWkdxuSE5n1kDM2KaZjWrS30EtgLe/CWvBXQ8pbFGVkBNlydpYV1h5pBM2UK5ScJWRAZFwzgzu5wYr/C0WcLW5W8/edHXzvepkvkNaDjcmOEwwvpzMubsHyVYumORJ51JLcX3AL4ZQuNgA8OyskyZO4yb+wZftFjqueKCj+Dpynck3HcaLSXqJ7MydmvR1MjnCr/zVH6pZk7XBPMEW96fR1jBHuazs8YqhGPnZS8oHY58b1FhijNAFEghjUboMFwNXgVndlaQnkvbAD1Ty+DyHulX6Z04UwK4GHpbGWYOuJ41BUTh+rmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp+mKk19EKL6PRm5jtSnTYEdjTxNeLaKGg1SBXQL5EA=;
 b=WjwzGk3/O8d3fTmguM01CSttjm9ffAWiKiBI1LvmvjuJ7MCiDP7ZqVv7IyLEkUIJOaUBBaEzQPYjdSyBV8y08T2GrUNR38RY6wb5UKfLt27wZS6pht0tKeg9oP4ZURcv7/QCBZ0ozGGAF6+Fxez5dexvpHGKyLYjCJo4NK8IFhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8489.eurprd04.prod.outlook.com (2603:10a6:102:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 11:05:25 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 11:05:25 +0000
Message-ID: <3c0405f4-6059-411a-8854-727581e37484@cherry.de>
Date: Tue, 17 Dec 2024 12:05:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] set_versions.py: use
 backward-compatible python argument in run
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241217-capture-output-compat-v1-1-d8f147a12eea@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241217-capture-output-compat-v1-1-d8f147a12eea@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0287.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c04757-485b-40a6-e81e-08dd1e8ab550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2NYclZ6dmhUYnZzMlVmeThJRGxCZEhsZk40a0JnYXlWYlVOcFl2eStEZkd4?=
 =?utf-8?B?ZVNHZHFuWHdwcHdsUnZOR1pJQXJkMURnd1FIcFh3RUdUQjkrTTlHQ1lqeTds?=
 =?utf-8?B?M0FXWmloMWNhZ3lmM0ZEOHB2aDJIemhxVVUwUkdQOTNSL3BLMGE5UHc0b3Ay?=
 =?utf-8?B?ajc5RU9nUDNXYjJLYlU0Tm81eDVZVHMvZXpIMXJPQTJXRUFwb3V3TEJUL2ox?=
 =?utf-8?B?UHRyRjFiU2JvRzZoNTBNbnBPa1ZucXZDMGNwSlRPTFVmUWRyYjdnN0ZPWmZn?=
 =?utf-8?B?Z3l4M2VFdGh0U05HTmIraVpPV1V2N1dNRkZZZ2g4ZDFhUG9hK3ByeEUxaDBn?=
 =?utf-8?B?THZaUGZxNkhoQkl6dWtrQ3pWOWpSRVFnb0JaMFliSmJFUXlVUW5aSDRZOE9Q?=
 =?utf-8?B?amZYaFk1NndJUU9LT3VaS1BxR2dWM0R0RWRJNVlhNFY0a0p0MUtPUHVKU0I0?=
 =?utf-8?B?MDZ5TFZxbFh5ajVFeUsxWU4vbDVjdllyMWVBN3FaZytMU0RsUkt1MDdvRGMr?=
 =?utf-8?B?bVIvTnlmWUVodWQ0V0xMeTlrOE9uazAzcjZTNkg5UnF3Q0tkVForcnpCNTNU?=
 =?utf-8?B?ZVI5ZGlzaXVKSG9zd2dlQzNmOG5wbkVzT1djUWtPWVFKU3Q4VW5uU1hVKzRi?=
 =?utf-8?B?elkwK0J1bUorZDlGNW12UkNPM0F1eVdDaWE3TEg2VnVTVzgzOXRJU2MvS2Vj?=
 =?utf-8?B?emY3bGdsVzVYT2xqYVo3bWs1aGVZbHZvQkE0WDNlUU56emx5TGJsRzRrczU2?=
 =?utf-8?B?SXhzSTVIdjhhY3FLanBOUndoNDVndnV0elF2L3BLVEZKeDVuNW1DT1lPMXVO?=
 =?utf-8?B?YXpWVE1kcFEzSXZrNDZiQi9JNWphdWdyZzhJY3h1emxvaHhYZTVXQzVqak5H?=
 =?utf-8?B?NEpxanpMMFA0QWh1VGZvemNwME9pMmtmRVpMN3A1RTVmL3R6bVA3aW1rcWp3?=
 =?utf-8?B?ajI0SWZsSmdmSFgrM0wrMGVsNFp5OUJ3S2p1RGt1N1Jyc1p4c2o4LzdZNnlw?=
 =?utf-8?B?Vk51UWcvOFdSbzFxVktSdlo2U3p4VTFJUHBIbHJzazNHQnEvaER6NUMrMXpW?=
 =?utf-8?B?dnFCSVFiZFNNd2VEdWo4TSt6TTFRZDVFbm1QTlA0U2VEeXZBSFF5UVB6dWtn?=
 =?utf-8?B?WFprdGFZMjRvamVocGdvMk0zSTI1T0F4Sk1GeEVoR3JWeFYxL0gzZ0xhUFU5?=
 =?utf-8?B?Sk11YmhNb3FGemo0UEU1bENESVA2WEJYOVRFTVMxZzljRGQxNVloZUVnK2FS?=
 =?utf-8?B?bExxV2s4T0hETnhoUW50ZkhobFUybmhNQ0lyN0kzdUdmNy9OZFFDRC84S3BN?=
 =?utf-8?B?UGFHdjVjTGU2YmVBSHN5RXkrS1U1OGRqYVMzSHRkQmhkbGRvUnA5cFdXSUZT?=
 =?utf-8?B?azNzcitrSXNEQTBJT0syR2tIQlYzYk01RG55Vis3UzloaExIYWlwL0VPYS9D?=
 =?utf-8?B?eDhUNEM5eXdnVmV1VGg1RjhtRzNCY2IzTUI5V2VsU3VqbGEveWh2cGhTRG9F?=
 =?utf-8?B?OUxVZ0pVN3BLUzlqOGRmRHpSWTRBSXlzeGxBN3FEMkM5clZPaEpqVWtJVzF1?=
 =?utf-8?B?alpWbjRvQVZINUlnTDRoY1pCQmd0ZEI0US9OeWpVTm9JVFAvbjdESFEvVkkw?=
 =?utf-8?B?V1pxTkxGUCtkSm5BcVNFU1NaZjhseENmaWJkUnFQdnlhcjRQV0x4UExSNnFE?=
 =?utf-8?B?bjIxRjY0c0tEZ2lhK0oxQkFUenVVQUx4Q0U3NUo1ZFFEMTA5UEY3RUtLNEs3?=
 =?utf-8?Q?U9yczqKsWVRRwV6hllRLQJa8i+XGXHI4al7qyfN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0tQb2FVY1BKdVhqOG1pRTIxUVdwZVVwMjQ1QUpQM1hKaC85QzFTeFZtb3RH?=
 =?utf-8?B?bFhRcXA1akFMT2VhM0FSYS9URXJ3bnhiMXdmbzlIS3lGZXI5dHFhSXlYMW9V?=
 =?utf-8?B?WW43SThnV3dWSEZzN0dzVGcvU2lZamZtM0xMNHlXUWV4TGJPQlhZTzk4enE2?=
 =?utf-8?B?VmZOd3VOb28yZVVCeHUySU9aNElubm5QaDlRM3lNakxPdWprb1VWdXNVVDF6?=
 =?utf-8?B?ajZGU01xZmN4Uk4yeG82UU54TXIvMU5OejI4Uk9EdmwwOFBSU0h5K3JzRG52?=
 =?utf-8?B?Ukh2cWpFdEFta0IwTG5IUEQ0SmdQSlhqa1lYazVnbGc5RXZKTW9DVFN5UGJj?=
 =?utf-8?B?ZHBTclRFT3dTVGtvNlhaV1QzT052V0kxK2c3SWIvQ25yUXloR1NWUk9md2Ja?=
 =?utf-8?B?WER1Y1VDZGRpdTRnbk9pbXRqclYvQXpvdVJVSW0weTVnT0Z4SCtqK1Q2WVpE?=
 =?utf-8?B?WUM1NkRaYm5vOTFGZXNmR21XK0ptdEpMTExCbW5QN3JsL3Z0UU5waDN1OTBz?=
 =?utf-8?B?Q0Vnekp6bUtXNnlYZmE3VWkybEgwMGxLS2J6enZ3WU9XKzIwWVBadTBVa0xW?=
 =?utf-8?B?aEhoM2lrQ0l1dzNLaC83eEpzVUR1STJjVkhZQXlwQWdGNWhGVC9vRTJRNGhI?=
 =?utf-8?B?VFpWMWg4V0Q3N2xvMW5TYWYyYjBoZXBuL2FFVzVqaTZmNk5mT3pkTG9TK01v?=
 =?utf-8?B?Wi91bXBRNnJFcSszaXY2UjByaXkwa2JwWUs3Nzd5d1VvZWs2QnB1cCtzL2lz?=
 =?utf-8?B?NkFXeWNza0FxUEF5OE12OG5hL1dWVERFamhjU0NZcnJDQmlCaVUwd0llb0xk?=
 =?utf-8?B?S0Q4NFZwYjZwNVcxYnlyNWREdlJlaFlrWUhhMzVwdFhkSVNvNjVnL3pGdlA3?=
 =?utf-8?B?cXhpVE00Q2hOZWNKOFljd1dJU2xjTFVWS3VVOVUyaG4vMmtxTmF2eTZHS3pt?=
 =?utf-8?B?a1VlWU5WQ3F1Vzg2aVJ6N0dVM0RhS0RWcS83OEhNQ1N3OEx0TTRiYlUzYURi?=
 =?utf-8?B?QXVieENHZEVLRVFXUHRXQ2Nob00rVmZ6ejhITDhraEk0bFRGMzdHQ2VGdUNt?=
 =?utf-8?B?WDA0dGJWem9pbnhtS0VqRXQ1YW1uU2lubVJndThDRDRLaVNBYTRuQW8xek1l?=
 =?utf-8?B?aEFVaXBZemhOV20wNml4Z2ZDNjNlZlNqWDN4SEFqcHVxaWxWYjd6UEZESHhO?=
 =?utf-8?B?WFpDMkdWTHo3MFV6RmpLbDRzWWJ3Q1JHNFN3cG5VcjIzbWhCWVpxZytXQUNy?=
 =?utf-8?B?MW0vdVZZU240ZVFlb003RUdHci9WK3lIajBCQjROYjVVbW9EaEVWU3VRZGhB?=
 =?utf-8?B?aW9WN1l1dGVUS0lGZVp4bjRjRnpHTCtxeHZ5TlpGZjBTN2pNV2hVUGltbnV3?=
 =?utf-8?B?VlNVNXlRMmZqaHpyYmN1dWsxblkrejZiQ3k0UW9oVEd2emhzK1RtbllNdUp4?=
 =?utf-8?B?SlNlUG1NVmdKN0dLYmRoUUQxQ1FPaW9IK2NMNXBpMzhrVk1LN0ZMcExzWnNh?=
 =?utf-8?B?UEVETzlZcDJRdjJQVXgxMGpoQXVmY2JqUzlZQTRzS2dJajFKanJscXJGbDFK?=
 =?utf-8?B?d084L09jbXZYZmdpR0hqN3lHa1QwNU5uN2xyNFBncXRUTnVFcTRQRFJRZjVR?=
 =?utf-8?B?YjZlcnAvaWU1aFhaTmt1Y200SldZTzhkWTh5OVB2eEh6R2t1OExZRzlrL0hM?=
 =?utf-8?B?eThPdmt2NWk5dGhraUpWVDNwSGMvNjlpTU03YldqSk5sZFFIcng4TDdOV241?=
 =?utf-8?B?aFUwWUdhVWs4Ym54U2xYejUyVW9iYTBZSk1jT0cvZ0lhWmhDZTNOU2VJbzRk?=
 =?utf-8?B?WDNwdFpvNExTNm1UUW4vRTN5Y2pLRTh6TGRpQ0h4TEd1Ly9hWFhpczltUkdJ?=
 =?utf-8?B?OExjdUZiNWJRYzRRUWtWYk5RMGoweGMvcnFuSEhZWmc5TUFDRURCc1VncjlW?=
 =?utf-8?B?NkJXbDBqcEllL2RZbXM2VU50WlVMMmk3Z21TaEsvQVhnYlUraVY1UTc4UURU?=
 =?utf-8?B?QmZ1cUNJR08zY3p5YllybFhuMEtybHd0Ny82MERZci9rSlZQYUpuQjM0L0o0?=
 =?utf-8?B?eGR0ZkgzWHl5ZjhYUWxkKzJEWWVybTl6ZXpqUitaZDZDbkhmYUJPOTZrNzFK?=
 =?utf-8?B?QXdlOStRTzlmaStlVVdzZEF2RVkvbFI3ZGsvNU1uKy9TY3lKejBxYWdRdllv?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c04757-485b-40a6-e81e-08dd1e8ab550
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 11:05:25.3713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2rGrZqKI0wWcfIi8GHujorPKW58Y65asmiwfsc/mVPR/zdSy0uwvlb1RlVhx3UWsyKGJiJhWrJQmO1V2Us+wyYJMLcPrMj9QOutAXUU/ys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8489
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 11:05:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5960

Hi Antonin,

On 12/17/24 11:35 AM, Antonin Godard via lists.yoctoproject.org wrote:
> Some workers on the autobuilder reported the following error:
> 
>    File "./set_versions.py", line 102, in <module>
>      subprocess.run(["git", "show", "yocto-%s" % release_series[activereleases[0]]], capture_output=True, check=True)
>    File "/usr/lib64/python3.6/subprocess.py", line 423, in run
>      with Popen(*popenargs, **kwargs) as process:
>    TypeError: __init__() got an unexpected keyword argument 'capture_output'
> 
> See https://valkyrie.yoctoproject.org/#/builders/34/builds/86.
> 
> This is because capture_output was introduced in Python 3.7, and some of
> the support distributions are still on Python 3.6. Since capture_output
> is essentially just setting stdout and stderr to PIPE
> (https://github.com/python/cpython/blob/3.13/Lib/subprocess.py#L547), do
> it manually here to be compatible with older python versions.
> 
> This is also the case for the "text" parameter, introduced in 3.7 to
> alias the universal_newlines parameter. Use "universal_newlines" to be
> backward-compatible.
> 
> [ YOCTO #15687 ]
> 

Do we really want to open that can of worms?

https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-git-tar-python-make-and-gcc-versions 
clearly states the minimal supported Python version is 3.8.0 so maybe we 
should just stop building the docs on those distros that are still on 
old Python? I'm actually surprised building YP on AlmaLinux 8 works 
then, is it because of uninative?

Looks ok to me otherwise.

Cheers,
Quentin

