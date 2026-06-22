Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332DACD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 10:33:07 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39909.1782124381696978205
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=TDl9CJsV;
 spf=pass (domain: cherry.de, ip: 52.101.83.2, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaIw/7DH1EcBXOzr5BSpGMqA4ln+rOAgBqeCF6sSclkhi8v6OdkhqxVcschvUdcSq+Y7MB7bsqpE2XVXiHmKTE3ltyR+5LFlrBX/AwshMfPrQ3vB3zqRL0+U4O4stkuOPNv3wqi1/anAJe2trmcAjXC/gxX9rx/SoPHYCM6HqV4CvXFEHUSqxrRfox+uEDXnnxZSGSVvFTo4gHNAzRfb1WTF3KZBV4T1HLMgaAoT8cO3Q2MqFpZcCJFxuNhSw8qkAasZCrqbj14YaaGZdcnntUoHPGiYlYhk8YG+9CVN0zXpZeBny1hAotAthNmdUkxHlZhnYyaPD3+18uD/xZwktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCrMm+Lvp+yTkZDkfe9G+Rthjownoom4ifQX2D2wB+o=;
 b=WUheCZHZOXL8VRtaERzIdahppZzN9St9asGdScjE4C3QkabedNz7uCHL5oQ5crdkF8HP6oit1TA37SkHj9t/+oYqm5Bcg57orY6I3/ma1eKSYu4VzDcGAAvVmIzhBJFWi9tDH+pmQdq1grfdody6YlswuL6IcrXbLhn1FrcgEFD3u+aONqmZpaiaFtfEHop8ujSYZoAmoiLAXXnHlXcIIYWJpHMyg3zRCrZjmy2VMqvmwBCnPL1KU30XBPB1+MGAU64WtV6DYXNFAdxWaZq8o1MwGobBaOeQZY+mpq/fthpyqtnCOSp5Egj+7JuzGcioUQBfKzCxiNeKFh0gf5rV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCrMm+Lvp+yTkZDkfe9G+Rthjownoom4ifQX2D2wB+o=;
 b=TDl9CJsV4G/AwGRtPTasmAQzhGqlHoPIhA9pRKcOyzuQHKFYhIIziRKvIV8K91GcHw6sCg+uNukvO7K1m1ZLsu/aMqk0oV/SVEg+vYESnO+lnA9QsqStLLiY+69oXxdi1mqhC6yqkDoyj7sfjXBwefdZQkMhYysGxjY6ADwR4yI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by FRWPR04MB11284.eurprd04.prod.outlook.com (2603:10a6:d10:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 10:32:56 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 10:32:56 +0000
Message-ID: <713d6342-ac38-47ad-89ad-8355c992605f@cherry.de>
Date: Mon, 22 Jun 2026 12:32:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] ubuntu/debian alleged doc-building packages seems
 inaccurate
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <18BA98A920CBE661.717820@lists.yoctoproject.org>
 <b63fa0d9-162b-fbce-8c47-52540ed6ff94@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b63fa0d9-162b-fbce-8c47-52540ed6ff94@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VIUP296CA0132.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34a::14) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|FRWPR04MB11284:EE_
X-MS-Office365-Filtering-Correlation-Id: a88fbbd3-ccac-4150-fce9-08ded0499f67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|4133799003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	xjNiP4uBU8GMGmeGJAFjzeZR/wFz1YrLGRtA62O/aeRAfHjBiE7Yszeo5UgReV9JjyIlsMwCALpsf5BPpm/LXYRXZEU5cEAhc1DmvKiaTbhID1VDnT9UhEcxCcpX+pPhrZ+lxy6r64/wh/8yOCmhAbU8AKX71PMBz/4YDGyApM1V8WI0aZ3WrWGKNkuoAnUxoTALCZETVqGiyj8mXcPkfgbh3TOAUSTI9HpPdk8dFhL8SpPcm8+XkWVKMyrxBllYelpzxs5dzKSSq2J1VpMPkfNsK7m+f+JvZGEDJ2VUrUgcco97u+M1xvBwmYGX8PVvqMnE1+OJ6sJY9iRDEUveQBBHwGeVD9lxD3vwpIaGbYtJ19FZ/sBEBDMGFYoDv4/FEhvE4Bin+4UieNHr8wo9Vc6LfN2cVPLRa1cCbD59CrPBK/lr8pCy/NhHqHXI8QYM8Ck/34BBChWtom5N/u52mrc3zZitUZA6X4vZd5nd9XdE6s0H6wb3+CQSAiYe/RmeMSau4HqXCdXGVVVWkHhvoeD2bTfre/nDqPKtkTcuKIn1sVZbobugmMD3SB7gekap5rUtpM3B7RYCHtegz+6qA1LbZFlc7IDAi0LpMvbj+TQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WTM2TjB4cW5uT3VJb1lITmhyKy9nVE9XKzIreUZYQjQvQ1pBM2Vja1hMeHd2?=
 =?utf-8?B?OHFsS0RMMUNyZEJWWTM3UnQyUGpWWHdnOUtkOVFvc2dVc2oxUWVJYjRBbkwz?=
 =?utf-8?B?NE5EMFNDSHlpZ3d5WFkzbzh5NjJSWHJYQTZ3ZVJNeWJ2SzhHM2pITmtjTUdp?=
 =?utf-8?B?ZEVGOVIySXFMaFZDQkFSa1BwMGNNN2kvQkVNSVhVUE5Bc2c0dXpET2JCOEov?=
 =?utf-8?B?ZzlzVm14QmYwd3lodXh3eXNiZXp1YXoxeXVpenUrc0FPYkFHR0RWQjdkd1BY?=
 =?utf-8?B?S1hib203SmNPQ2xDaFVrQm4wS29JWTFwdEQvL3h4SmxwaUQ1SmJUdWw2SVk4?=
 =?utf-8?B?Y0hGdFRBdkVZa29ibXIrVHdZVjNrMlpObmtEcFV1ZDhEdWMyRm5FTzhpVHRm?=
 =?utf-8?B?ZlJsN1Vpb0FiV2ZvcGFnVFlqR1doYmpUZVlZNWt3OUFHTkdKRldsVUU0UTdn?=
 =?utf-8?B?U3BZSDJ1N1JjL2srZ2dXajVtSi8rZG8vK3lBUEtTMVh3R2tlbS8yWW93M1VH?=
 =?utf-8?B?VWMyTS9ldEx0RW5neVRTUGgxT3A5N3VxNnZCS20ydGY2ZXEvc3R2QUFDaXZu?=
 =?utf-8?B?RmJtUG1ENFB5OG9idzV4RXdwVjdzTFBuMFRrSVBtYkN4azNjK0czd3pmR09D?=
 =?utf-8?B?NUhwVGhyZFlta1RPTkRFU0VRZkVzZ1pFbi9yQURJdVcybjhpWHBzdmNiN3VW?=
 =?utf-8?B?RWZNU3FsY0lUdkxpSnhwVXRZWHJ6anUrV2xmU3pMZys1cDNDZXhrMXVEZFFY?=
 =?utf-8?B?WVMxbXprSVVLOXBLUVBaVDZZSmh3VHBmV0l6d2E4VkZwSXVNd3JPb3pLdUYr?=
 =?utf-8?B?YkE1bzdRTy9SOTg4eXI5UGtBcGNOVEFuODc2bThDZEQ2KzZUTFZ6cUtxS3F5?=
 =?utf-8?B?amRvdlR6MnBvS2tNOXpZMldibXBSVVJ1eTRFb1VuUDZQYmlvbFlZYWVrajhw?=
 =?utf-8?B?WlJEWFl3aER2ZysyZTVrYnlGN2ZOYkR3aGd6eUt0dkNsTTlva1FsS1F1SVFr?=
 =?utf-8?B?TGl6WXpFYjJtemU2N0VUdnQ2ajFzTTNFN3NFTmQvSldraEpLSy92ckNDRmZN?=
 =?utf-8?B?NmJmU0ljbldwdEtIT045cndvZXYwckFRRFQ1eW9kbHBOWkdTWUNadTFSNk1v?=
 =?utf-8?B?Umw4blJ5Z0VzZW4wa0xsQmhVMUFxcVUrL3l5OG1vZUlYdE9jZEdSellIK21M?=
 =?utf-8?B?Z1FMejNQMFIzMm9BR25QUEExek12R3JXRHBUUzVXQm5SY3k1Q1NZclFiWENs?=
 =?utf-8?B?U04xenlWTFhHNnFHdHAxclNFSVh0aGJTMThkWno5YmNEckVrQWhVTFkycEdn?=
 =?utf-8?B?U0kvenoxS28vT2NaRmNuMnVYaW9vZXN1bFZsSlpZaldtUTMvSEFOTmN6THJw?=
 =?utf-8?B?YmUzZGZXb004QnFYV2JvTmpIdXdoU0pZTFFwZVVLQ1IyUXRmZjNiaVZGQU52?=
 =?utf-8?B?ZXJkSGhYblE0QzY2SmpncW5Gc1B5VXdoVGh3ZGZrc2V5UW1wQ1JreEVyVlFM?=
 =?utf-8?B?QUQ0SSsxSlltek9NcHFkcURuUW1GV1NPc29HenRmUFR0Z3pqZnhkakgxb3dH?=
 =?utf-8?B?QUk1a1I3anR6ZnlPeGI4UjZVNGs1eUpsYWk3NEhmNnhqU2Y5ZkVydWlqMzN5?=
 =?utf-8?B?ZkYwL0hjQWx5cmY5VGNZRDZFSjFUNWFQZmRlT0U5NjFUNFF5QkY5OS9Mc3Ev?=
 =?utf-8?B?d0pzMmxIM0o5MTk1eTZuT25YUlVYM0ViUjFJOU91VUJyU1pIekpDM1JJRlN1?=
 =?utf-8?B?Q0ZPUSt1WXdjb2pweWR5ajZuNm5CT2FhUjJ2YjlwVGp3WnNHdFZsMWpSYkJP?=
 =?utf-8?B?YVBrRTRFSzRqcXF5T3hXL2tXTWJta0lyZmVXdlNzZ0NEWlg3RllPRnFYSHJl?=
 =?utf-8?B?SSt5N0h2ZVBLMW5rZnVPWGE2dWdzSlc0ek9NWlJoVlJMSks4N3F6dEVsV01q?=
 =?utf-8?B?bXhuc3pxeTAwWUFGOUhGd3Q4RldsVHkrVzhuNk94N2MwM0lJVzdNMXdHc3FP?=
 =?utf-8?B?THNHemVSZkViQmltTTZtbEFkREJweDVQMDVvQlVQZXEzSUY4WEhmUEhsa2FF?=
 =?utf-8?B?SHc0YUtCd1lNK2JQR2lJc0pNLzM0SFc1bmY3Qkxjem91N0dVVHlqMCtjckRP?=
 =?utf-8?B?dTNwdFgrTTNDNDltRnVVN0p2WXdQeVFrVEpNaXFDWDlkWmdPSWdyQUFXeVF2?=
 =?utf-8?B?S2hTVExqV3lRQUFvQ1RuNEgrOXJON2RHYlFqclNzQ0RKZW9wajh2WmdJczB4?=
 =?utf-8?B?dkRCR2tqVE9kMVROM3Z1NVArNncyWnAzNW5nMkszS3o1bU9BYm5DckZrR2Rn?=
 =?utf-8?B?RE1pbVZNUGRkQ1h2SGRwZTQ3akVqd2pTL255YjRDQ0QwalZpQmxUdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a88fbbd3-ccac-4150-fce9-08ded0499f67
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 10:32:56.0159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvlHrqM8K/y6WFg+7Bx9U7Yi1zzmP9vcvavKPlC8Zq5jrv2XhZUC3udbbflDd2Qsamv0lKnHLhiBt3HJxOZDZG8BuNmEOzvQvC/TUcpNiNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11284
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 10:33:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9828

Hi Robert,

On 6/21/26 7:48 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Fri, 19 Jun 2026, Robert P. J. Day wrote:
> 
>>
>> here:
>>
>> https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian
>>
>> we are told:
>>
>>    Here are the packages needed to build Project documentation manuals:
>>
>>    sudo apt install git librsvg2-bin locales make python3-saneyaml
>>      python3-pip python3-venv
>>
>> i've been building HTML docs all this time on my debian 13 system,
>> without:
>>
>>    - python3-pip
>>    - python3-saneyaml
>>    - python3-venv
>>
>> also (as should be obvious), i refuse to install python3 packages
>> via "pip", choosing instead to install then as debian python3-*

Why?

>> packages. so far, it's working out fine.
> 
>    after a few minutes of research, here are my observations on what
> packages are required to build docs on my debian 13 (and, no, i'm not
> sure about any underlying subtleties so i'm not submitting a patch).
> 
>    first, so far, i have avoided the use of "pip" entirely, preferring
> instead to install python3-* packages. from what i read, the preferred
> approach is to install debian packages globally, while preferring to
> use "pip3" exclusively inside a venv environment. i'm not going to
> comment on that either way, just saying that i've managed to avoid
> even *installing* python3-pip3 on this debian 13 system.
> 
>    as for packages i don't seem to need, as above:
> 
>    - python3-pip
>    - python3-saneyaml
>    - python3-venv
> 
> also, installing the debian package python3-sphinxcontrib.svg2pdfconverter
> already pulls in the dependency librsvg2-bin, so that does not need to
> be listed explicitly.
> 

Did you look at the version of packages we are installing in the venv?

We explicitly require svg2pdfconverter >= 2.0.0, which Trixie does not 
have. Why this version? Because it's the first that supports converting 
an SVG to a PNG, which we use for building Epubs.

>    finally, i have not installed python3-websockets, and i can build
> the HTML docs just fine.
> 

Where do we say you need to install python3-websockets for building the 
docs?

Cheers,
Quentin

