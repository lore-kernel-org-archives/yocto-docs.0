Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC48CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 13:04:20 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49253.1778504651035472681
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 06:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kVa63S/W;
 spf=pass (domain: cherry.de, ip: 52.101.69.56, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuFLgcZ5LvzP9KOr4ZFJWxGpJcrAwDpEg6YdtWRKYPx2pw625eff8yrxjdPwRGJ6Aztf4X73wxbrDMrlmWtxAbTzxEHnJXmF0Aj6oEcP70PqAt+RgoZiNr2vzJQ+Uo3BqaXG0soFIwOUyxlHZeXuSV7d9Q2BH2zFDfcwi/ZYeKtId5Xb2nSd/N4xjm+ARpqZdVlGimMudbbizbtcwsLNa++ogImY/XPN6zPrNtiG6EiO8wkzmzGsrvxXsBBC1Tye1Psch+H3QyZyPmoF73PDDRUE7kOFZpww6rofX0+GdK8RNfpo3UyZ/TKHsw/Yo7Sj2jPt6G3K6BryY2qC67fmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdMFIwx+xwKvnxHcrTqxhiz1zh2/k+K/aiLeXlsNf78=;
 b=r8xcd8o27t2zvuo8oLCP8Y/zVGkpPjk0STYKRkNvAuEk4Stte0KLWbtkxANvnxDmHF60sS7aVV2LTMcvq2w7cZtIVY7vGEkFPej6XM7twauCDWdN4RlWL8N3v7z1P9n0h//Ain3Bo0KsouLV9OO16qL5I3+ja46QRyKYuFm2yzaNuY4TymrAUn/fXb+yNcIKFok9Txv33y4ZXx6G4mrF2MIj6Hn+4baAbWSCI2KL7UKbJuJd95WqdLqMtd8i7ubw4rT6EFDruR6U6/faYGtex1T9FUnZWIeOKYBBaY8gaiOpZxFHoRq65tgv1uE6F2/q9vUK1maAQnpnbFVlI+HNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdMFIwx+xwKvnxHcrTqxhiz1zh2/k+K/aiLeXlsNf78=;
 b=kVa63S/W1wzL1bqB18hhvBw2FKFkEnyif/s0Ivbc3ZwdZ2VIoTSUFuLYwVAWNCAPBJloiO0f4iRdCpnn7Nuj6FK03kpjUtpyxm5DYq7mfsQcCyFFLJrYedL/YWu4Db8cyAMXIJSBGFtFvSb7JNCPX8Zqnouu1bqzuth76diTvPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AS4PR04MB9433.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:03:58 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 13:03:58 +0000
Message-ID: <76737129-3557-45a2-9201-149f9535168e@cherry.de>
Date: Mon, 11 May 2026 15:03:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Quick Build using word "naive" sounds a bit condescending
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <e9ecc3f8-c93c-caf1-eb73-de73633cda10@crashcourse.ca>
 <CANNYZj8TrFArNqiE2uTowv5RvnourbGoweJ_ySDXmjFKsx=P2w@mail.gmail.com>
 <d3a49bad-4a51-4493-8ba5-18bf68c19cc3@cherry.de>
 <CANNYZj93d9tG2ibte-KWQt9T05Z6xw_max05VSvRoz=0K8+CvA@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj93d9tG2ibte-KWQt9T05Z6xw_max05VSvRoz=0K8+CvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA1PEPF00005B92.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63a) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AS4PR04MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 75bafd3c-5107-4da8-24df-08deaf5dc39e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|11063799003|3023799003|4133799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	/jtrjcmrquZpyTUm9lwFRlROIS0DLE4o4BpgPtctQvjp+Y/OrelEh4CB3gUsY8MnsvY/UFsFq3rHvqrRNqNI65KV0nC8vLYrnHykPQivvZwin/R9utrGFHcRwWKel44pm/P7NeDmK1cPN/29EZJvUJyYoAIUaUTg93TCr9KJfqfVNIVYkVr0iAq1B3WClc+q4vxLNIH/LQBaNIgTOV4mBBNW8dwl24TsnvmA2L2LPQR8uv+aRTWdCpAUtTOKw0mYDWxZy7SyNn3o7Qyny9N3VH9RfwZg0bGe/PWSUnZwXJsWh+26TE1lnm60pLpetYULW5h0rkDusYogJreKd8o9b1VFY0j+0ScfxXAbbr2cDCnGdfFoUkj5blaXB/pjsU8apWvVB44nUZAMbFjycBEvpNeOp8JQz+dbjs5mtcErhTIxi5iYOuTBM7E234e4IHWIRNNOjmK+jCXN+z5z9uxg4sNm2drqb9A9ti5cxz4ESnx9Zlh5F9XLtY9DoF3hA6Mz6q0ic6KX2wIXMQv/8JG56pBT3ey16ukEXgCNvgOnIemWif9tFxIGuKvnIbOH4ytOXtlFWpsS328jVClm9E16qwnoTRm/wyo8qKNp6QOqk4VVE9xLxyfcOq3/3ceKDbDvCLaReCq4yXUtqM9XQot/Iw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799003)(3023799003)(4133799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N3NSL1NlVytUYlUySkdWNmk0aHpjdzBiVVFEVVBBMHBVTE15aEUwSVRMcUk4?=
 =?utf-8?B?cFVRM2s5Ri9vWFc1Mk9Razd1MHlDRU5BcUNWdVp5RlptbG1SdzZXaXM4NWcx?=
 =?utf-8?B?bWE0d2lXWWJIazgrR29sWVhSQzJJeXJRYmZya2ZjckUzd1ZUTzREY3ZtTlZ6?=
 =?utf-8?B?SEhBUG5tRGhJdVJrbGM3Qk8zTEd3OGJFN0o0d0pMNFg2ZXd4azU2QWVPdlc2?=
 =?utf-8?B?ZTNxd1l1SlVtWFpNbklJTTl0L2tWd2M0cEJvQk5xd0NWU3Z5UDdSZHlzcTJ2?=
 =?utf-8?B?bllYamJnampaeUpiZjVIRjMxcVg1THh2MWpFMjVQamJKUGVYSytvUGpKK1I4?=
 =?utf-8?B?UXMrVVB3VHh3ZmlUN2lhRHpxazVqdTNuWXV1azZXL282OHQzdmFHWVlXQ2U1?=
 =?utf-8?B?RG5CSjNVZyt2K1dCb3ZDZnk1RWEwZE1hZGw3QitlWjMxRVZmekhIM09neDNu?=
 =?utf-8?B?NGd1Vnd1Q3ZXNXBZdnRYRFY2b1NtRm1jczZCTE1kY25vclp5eFVRU2hyekFT?=
 =?utf-8?B?Si9TUENCN25xdXV4OGdWMUFSWnM5S05haXdWMFY3dSttVVZzNzh4WTEyYm9X?=
 =?utf-8?B?SkNON0NZRmcrLzloanN2dFRqa2d5NWlvY1FGQjdrWkIyUlVCWXN6WnpoTnFK?=
 =?utf-8?B?TW5sYWxRTU5nS0krZkQzOXZrN1EvdG56c1hJZUh1R0VvdTV4elZhQ3hxUzB4?=
 =?utf-8?B?dXUvaUV3T3NKclBKdk93ZGdmQkJaTXFJNGZSZWlsMVdhTDdvMU5KOUpZSXRx?=
 =?utf-8?B?dW1sTTcvSTVFbVZjdklMcUh5b0JrYjVmVllYSDNRM3hlMCtJcEJ6bWlHQk5G?=
 =?utf-8?B?Y2dUVG16SUt2T2pmeVhpWFJjS3Azcnd4VzVKMWkrdElGTkQvNXc1SG1ZWTVt?=
 =?utf-8?B?QS9kS2ZkdzBZUmxTSE5XazR2c2RVSGtROUt5bGlOSjg2RVE4NXlhSWtCMHNR?=
 =?utf-8?B?a3p5aEx1L0xXeDM4RTJDeFkxQkdza0ZGSExZQW5FNXBYSmcrNjlXOWMzVjBI?=
 =?utf-8?B?c0F2dFFXYVZWL3lRaUdJcEVybFFaT3AzYWJ5Q0t2NGtCYkJzQjd4VlhCQzhK?=
 =?utf-8?B?YnhWYXRkYWw5ZTNjWEd4b1UzYkdoZ3h3Vm9qNjlZOW1NSitJL1BWNERCVGxk?=
 =?utf-8?B?Z3l5OXU5cEJFVDJ5Z3hZOVc5V2FMRDhGeXdBMnA5RnlXVitRbHAzazQvMkh6?=
 =?utf-8?B?VjMyMGFZZW9ZN3dnR2Nnc3lzeVVzaFFMYm8yVzliMENoR01BWlZ0YjhwMjdx?=
 =?utf-8?B?VlgxNit4M2F1blJHajc3RitiZ0Z4QmVTM09zQVhPSjFSRVJBU1JOVUJ0U3Iz?=
 =?utf-8?B?NGVSUE1CL3p6Q1I5U0pqUXNpOVI5Qi96U3doMURtTkVmUkliK1hpV3RkSWRq?=
 =?utf-8?B?T3NBWmdUTzZVUmV1cUFXcU9SQUR0S05aYzJkZ2FEbkRNZEMyZlRkeHd6SDJh?=
 =?utf-8?B?SnpxSVV5aEhIcU5nTHFWa1FTTExwc2NtWnZEcUFsaGd3eDNFd2RNZmE3K29w?=
 =?utf-8?B?Mi9pb0hwMkEvaFFRY2ExZklNbzhnRG1Ob045dk5VMUlxWUNMYzkrR3E5RHp6?=
 =?utf-8?B?Rmw2R1JIVTExRmlHUC9NbFVEeUV4ZWFUOWFmRmpMMThPa3BtTGRPa25xM1gv?=
 =?utf-8?B?d0JzS3JEaGdGdnQvbm5PcnVDSkU3MWpsR3hlMm9XVkRNS0FmQ29taGhZaW41?=
 =?utf-8?B?dEwxam44Rm9oQTJMOFdEYVhPSTRkdGozVHZqWFMzYllVcFIycVBEWUNWMDNS?=
 =?utf-8?B?N21VS2crQnVZaDZuWHJML0gvaDMxcXUzZGZVQ1l2QW5wMnZsODlvYTRvamlh?=
 =?utf-8?B?WE5DaGdxMU82UDh4WTBBclFJV3BnSXh0SC92Ulg5TnhKaWNpUWdpS1FmaFJ5?=
 =?utf-8?B?MlVrWXV1U0tnQUgzUkU1NCtzYnZsOGRKbzlTbGxBNVRLeExMYjU4WkdCT2sv?=
 =?utf-8?B?V3VyYkhOQ0l6aE4ya0dyVFVnMHg3Ykl1aTAzcWQ5cndRbndzaHkybmdxbGh1?=
 =?utf-8?B?ZEM5UXBEVURvTTI0NEExRTdPaGVOQWMyRWRpODN1WlVKQjduY1JqTUd1dlYy?=
 =?utf-8?B?RDhtWStXRkxsTC9ldFN1MHYwTTN5VFRiOGRMRkZKcHZORW1tenVyNm0yS2tY?=
 =?utf-8?B?bEtmdWlNYk81QVh0NFBidlpsbHFoN2YyN1RFUzBlQWo1OWwzV2haOVRxancr?=
 =?utf-8?B?bjNHbEt5R0FKTkVid3M3WGpISW1yaUZCVWJ0WUYzczM5cTVtL1Blbkd2b21F?=
 =?utf-8?B?RnBiOWE4OTh4VHZhUklob1RlQ3M5TGo2YjdweHlDdjhiaG40ZTlvdWR0YTQy?=
 =?utf-8?B?Q0thL0pyNWx0SHdqRWV4SmEzaCtjYzVMQU1xN3FReTlCWDJzZ3NXZz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 75bafd3c-5107-4da8-24df-08deaf5dc39e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:03:58.3799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuPXTS9/1WRVayJNAByb9TXx/Yh+R3V6GNlLyW38RoRAHHddm/AA56aoNFc5GGcfvVA1IdR7CiUAQX2EFlFrBolkewKVV2v+ODUz2C5czdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9433
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 13:04:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9451

On 5/11/26 12:23 PM, Alexander Kanavin wrote:
> On Mon, 11 May 2026 at 11:55, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>> Source?
>>
>> This was added a year and a half ago, so I'm not sure we can say it's
>> outdated without more info than gut feeling.
> 
> Maybe outdated is the wrong word. Rather I can't make sense of what is
> meant by 'interactive shell is not available'. What would be the
> scenario for that? How is one supposed to then run the suggested
> commands (or bitbake when everything is set up, for that matter):
> 
> $ echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
> $ locale-gen
> 
> and why they can't simply run dpkg-reconfigure instead? The dollar
> sign in front of these commands does imply interactive shell :-/
> 

As far as I remember, interactive shell not available is usually what 
happens when you run your shell scripts in CI and stdin isn't available, 
meaning you cannot interact with the shell. This probably was somewhat 
related to the --interactive option of podman-run, where it says:

--interactive, -i

When set to true, make stdin available to the contained process. If 
false, the stdin of the contained process is empty and immediately closed.

We can always improve our wording/phrasing though!

>>> This whole Debian-specific section is also duplicated in the reference
>>> manual, so the quickstart should simply defer to that:
>>> https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host
>>>
>>
>> Yes, by design. See 411e8ebcf79d ("make sure Quick Build section and
>> System Requirements are in sync").
> 
> To me it's a bit odd that quickstart includes the debian/ubuntu
> section, but not fedora/suse/alma etc. I'd say it's more fair and
> consistent to either include all of them, or none and link to the
> ref-manual.
> 

Also a deliberate choice made by Antonin, see 
https://lore.kernel.org/yocto-docs/DEH0FJ96MF58.TDE0QZF0AM5A@bootlin.com/.

I've exposed my arguments then and I've nothing to add :)

Cheers,
Quentin

