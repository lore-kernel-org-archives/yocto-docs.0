Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631C0C77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 14:07:20 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.43])
 by mx.groups.io with SMTP id smtpd.web11.20670.1750687630410962047
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 07:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=bl39qiUk;
 spf=pass (domain: cherry.de, ip: 52.101.71.43, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTdOuRzwW6DRbLnrtxzn17KxYYZfDfWXLtHK0IIrNZW8H2GB0vPYyGftUlJWl4Op+TnyWynL50Z7UkyLmWvYkmLCi+JEcBz+9qYUmfza8OfKHXQ1qPms0pvvJ+z+n3+3qNCGD4pvCu4yCpsemE6oPy14Koed+0exihNdv6Yw7qnbC7yhHUvufwAFHHRJmbyK38I8xCo+9fMbAl2f82OtcrUTM9MdSBBLKTwXBrCUD6k+OcRclSvQNCW7sNRWOHLxp0yeKTs/a/TBPgXlgrd+p7Z1AYFAwqA/y3lr0IX0bsJyh33lYO7kzeYirhTCzNGDMFSFeZACA9AKAbQnco0pvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2A9wiJXvjcwqYVx2gonwXXwrVbnhgchJE3TcZhFIngE=;
 b=GsWMLSLALkCFJYgayt6W+3ySZubvHi0SYjfRgAjuorfGk/VpsMx5+hJHIhxSwwxGzxSc5NtmArgFjzv75Tv7d/iiOgp7/0+n+Qxh10w8Ut1/TS/+NAMsUabFBKYh7a8/w3EHOEDy4Vvx2wk9vFhG+7wNf9TuFclHz3gKrOtTa1qv3A9cX9ZotN2OVOleva31yofcRd0IuWnTZlOaCW18JRyucpWhJOB3eoFP95rMscd0pKCJUaHJTm3adgvSHEmme7isHjMWoLB2HpliUorEEo/g1Q+JWrKM848MkleHUJTR2srdKGMSZZViSOXm1xWF8ymY+W4eEBEqFUm10D+B2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2A9wiJXvjcwqYVx2gonwXXwrVbnhgchJE3TcZhFIngE=;
 b=bl39qiUkCyLcV2Iqh9hsRCcdGcNnEY/BG28H5DFBPnzf/6xLfumX8gRIZbbiC22REt7kLTY5tB/bNDV3t23GR7WbW+gh6gPQ3wxz/wVvFpkPDfxB1d8bKrzku81gQCYanG/9r/Zg7tlPaGhixDWORYoByxY5nh/EtBMqMeUY2xI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7768.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 14:07:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:07:07 +0000
Message-ID: <72507079-aaa2-40c4-b1cd-9f374e839bfd@cherry.de>
Date: Mon, 23 Jun 2025 16:07:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] improper rendering of ":term:" in bold
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <8a705bb7-e1d2-a784-0018-a3106d02bbf8@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <8a705bb7-e1d2-a784-0018-a3106d02bbf8@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0394.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b439fc8-55b8-49dc-192e-08ddb25f3d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cllCU0VObGVJM2E5Rk41cGNpV05FdmNLV1lpRlEwbTJLeUdGaWg1VU1Jbld1?=
 =?utf-8?B?anh5UmJBM2tTVUZqeURNNC9aUjdqeElrV29MZURqbXYzdDdMZkZBQ2NFUmJn?=
 =?utf-8?B?TlRhVWY0U2wzNzhUUjJiNWdnb3RGM0MxcjNxQk0xdDl6SkFtYkhtWUxVMDdB?=
 =?utf-8?B?UnJQbVZpMkhQb3ZwbVR5V2FZQ3RZWWtMWjVGRFVuK0ZaV2ZRbm1TWWMvMXZs?=
 =?utf-8?B?YTUxTTBhWTA2WWtrdFJGcjJEK0kva3Q4SUJ4UUlVT0l5ZlRNd2p5ajl1cXp3?=
 =?utf-8?B?MGhkdFp5a0dYMldrUndCSWJUa0lvS0FTbXQ2SzhBWVlWaXhhNVFTcFJQWmpE?=
 =?utf-8?B?QUJKclErR0N0cDNaaG8yaEErZVlTd2cwTUlUa0lKTDdLQ1hOVlhjUVFZOTZh?=
 =?utf-8?B?T1JDQkZqM1kxQnFBajF2MVlhTloxMkt6aFZxQmVkcWhmakYwTTEvUkVKS2xk?=
 =?utf-8?B?VDVhcnBYaDJmc3VCL3NLY3FUTjVJenJQMG5CT2FBdlltN0ZTU1JUbmVjL0Zv?=
 =?utf-8?B?K3lINVpQYTBtWDUrYzZCYTY1ckhVMCtmejg2YzQvOXlXWDFuZVkxazRUcEc2?=
 =?utf-8?B?RnJ5d2RKZ1JzVWZ1MFQ1bzd5cEdwR08wUGpiZk9TbmV0UHNmakJuOXM1Q2Js?=
 =?utf-8?B?aCtpTUtUazFKUWJ5NVc3ZlBkYTBNT2UyWmhTWmR4a0VrZmJscStaSXcyS3FB?=
 =?utf-8?B?eXdsak02aTgvQXg4MUo3RzBGb0dEcWE1VG8xUHM5OGFmMUVLdloweGJsNmVi?=
 =?utf-8?B?em9GQUd3TmRQNThBaWd2NTFrVFhldWJPbitiMUV5WEx0U25PR2RWSjlWTHhR?=
 =?utf-8?B?ZnRUVWwyYk5TK0p4aDVWUysrU0FKeUxPMC8xVlArU1hnaU93U3BMWXpiMzRr?=
 =?utf-8?B?cEd4TG9YOThNbExTZG1TNWZETVc1SFgvQkQ0MEg3QUJGSEY2MGdnZEtYMTdV?=
 =?utf-8?B?UWUxVjdMOGhSc3p6WWdYTWV3NjlDbWdNd2dpa2dlaHNndmhNb0VmYzFGQWd4?=
 =?utf-8?B?ZUlGUkZLLy80Si9Ub0NrSUhQaFZTN09WVWpmU3dZMGx4akc4RjdWRmx2SlpS?=
 =?utf-8?B?bEVYdEhIUXA0VG1GU3d5Y0l3NjdFd0J5aDk1N2RRWVo1SWJhQlNFWXRFc1Jk?=
 =?utf-8?B?V0k4dGh5LzNqMjFqSDBlTTBPdmt0K1ZWVmwxN2lLNmtTL0I3MFZFN25QMlVN?=
 =?utf-8?B?SHZSdk91cFAyQUFtalcvVTc5UG1hNXczN0dCK3d3V0dKUkZKZGhmSUc4TTRQ?=
 =?utf-8?B?RnpjbEVpQUsweXBySXdoemMyLzNhVjVGbThicURKWHdGUlZzV0VtellNcCta?=
 =?utf-8?B?ZUpvNkN0cWptN1lpTHRpa2hVeHpLc1ZQR3k4bzhyVnZCZ1l0bWVYSXRiQ3Vm?=
 =?utf-8?B?L0c2UUZzMDBVeDkzc3lBS1NXbFF3UXNaUVpRNEVYNEtWWWtvYjUvNVFDQTVR?=
 =?utf-8?B?bnVnd1FkejhiMDBDVitvT1ZmRk1ldDl3SGpWZTV2ZnRjclJ5Sytmc1pTdXk2?=
 =?utf-8?B?cTlXZU1KVEd1bkN0d3J6V1AzMFJtOWE5UzRhYVcxNy9tYnQ0ZSthcmk4RjRi?=
 =?utf-8?B?Z1pFc05YMjNBY3VObWdsT1pNWjJ5ZzJNK1M3aFpsSE8rbHh3QVdmSGU0TlN6?=
 =?utf-8?B?ZnVXaVZBd3pOU2NueGxtYi9PTmhyYlo1Nm1LcTRBUE1iTmxxeFNxcW9BVmV6?=
 =?utf-8?B?dTJRSUdSMWdQbVJMU0lHbk9GRmxFL0QxNGN0N21zSkNKeE1QZXlMUEtseitN?=
 =?utf-8?B?TCtPN1NDNm1Uc2l3NmpTcWowazJ6b2JwbUFwZkJQamhXYnkwR2RVamJSNkhv?=
 =?utf-8?Q?BozmyKueyssw8KDSYES0RONEE5Y1ZZAHuPa9Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M3dscUFuNzNGSXppQ2dma3dTNzJhUE1jS2NKNENob1phZllBUlhWazRzNHc3?=
 =?utf-8?B?cVIwWi84ZUREc3pQb2c1dHowNmxEK0NIMlYxQ3ZRM1J1eWVjQjlDU05TN3No?=
 =?utf-8?B?enJmK0pzRHVFTGJYMDNxNUkrNW1kRmUrS3IrdnNWQVFscUNzOXVYUmtjM1Np?=
 =?utf-8?B?MTBXbDV6MWRnNGFaVC9lcFNzbjZEQ0NDUmNlZCtvM1hMSnFlYXozYWlIRkhn?=
 =?utf-8?B?c3FjYmxLZXd1aXZpa1JOWTNWZGlObUFnSzhkS0xwWHA2N0VFd2pUNW5teUR3?=
 =?utf-8?B?UkdkSUUwY2tVaVo2SG5PTWIzQU0rdEJGUzFIMFN4RmRRQWF6RmsvOHgyQ0hx?=
 =?utf-8?B?blkvcnNRaEl6TEs5U1lFeVVEdThZVkw1blFGUldOZzlJTUNQMWsrbFlyd1Y2?=
 =?utf-8?B?cDVLTldWdkk1cm1PeFRwbGZUUUp1Q2FoamxZK3E3amJncG84Tk1sMmJ3aWNN?=
 =?utf-8?B?bnA4VUNuTXNpWUZOUERyS09nazhhZTdhSEU3L3FnTGwrK20zdDJ4MUtzSFEw?=
 =?utf-8?B?SDQ0Q0pvNzIvT2VlVGt6YjVwUU92REdaRk8xTlhpbk1MOGJxYlQrVXA2SUla?=
 =?utf-8?B?NHpDQkZoSk5tNktIMjVnMDF5U0lXanJISzZIQml1V0ZlM3F1RWV4SWl0ZDlU?=
 =?utf-8?B?ZnRHWStVc1BNU0FmVStmR2lsK0dvZWNIcFAvWm1kY1VXVDVUNEJDOGpmSW1D?=
 =?utf-8?B?aVJUYXUyL2JSbm5OYWp0QVF5NUl1ZG51Z0ZLcmxsT20raTRKdmp3RkdsUEEz?=
 =?utf-8?B?NG9uUnkzS0MvSUVERk9wOCtKTjVJcTYwSms0MlZLaEd5cWdoZDZvd2dWQjNi?=
 =?utf-8?B?Tm83SzBOR2tXdGRMYjNHWGxvY0VhKzYzTjJvWVNpVEh4RkgyTGt3VS9LZ2s0?=
 =?utf-8?B?SlMwSkk1MG9jSlBzcGpJc1FaTkJlSXV0bStvSlB4Z0gvUEw3UEowTmJRZXNv?=
 =?utf-8?B?ZVEzWnBPL3E5MXpZT0s1QlZUM0ZXUnJvZEwyeVNjRnlzVzFtbkZxaG5qRTF2?=
 =?utf-8?B?QXRIVTNyOUJMeTVqWFBjOVZTYW45NFRDaUswdUh1TEVVREwxQ2wxUWZIUTEw?=
 =?utf-8?B?OXZGNFN4VHdDbUJuQ2pVRDZLVXNIVVJ6bENDOC84YVdWdnBPKytaUlY2NGR6?=
 =?utf-8?B?dWRpak5ERUY0cmhVNUhzQXFLNTVtdVZyb3BKTjlTbUgrVWxRLy9XMm5EUGxu?=
 =?utf-8?B?V011ZWZjTFBDQ3RtZmVmcWhYQVlITTNLRU5SbnZYckRlNmlnak9xazcwN3JP?=
 =?utf-8?B?T1grdnVweVFjMDZCdU1mVDVEaUF1MWkrblF4azZ4T0dTWk96V3lNMEZ5MTFK?=
 =?utf-8?B?QUpQci9McVdCWkREMGQrS1hlVS96WHpTUFRsUjRzaXM4QUc2U3hESHp2bkc2?=
 =?utf-8?B?WnRPZVdneWR1eWNmOEZmUklZYm9YWWc0T3k1Yi92eG02OVZXNUlvRmYvTVF5?=
 =?utf-8?B?ZGEvQ1gxSW1tZ3RyL3BXWDFaZUN5NGoydG1VcUtadzRVM3lXTEl5TWNPS2I5?=
 =?utf-8?B?QUtrYk1sbnRiU1RxbTIvWGZweVhSV0lUVTFnQW9wdGljenNieDJoSkdyU1Uw?=
 =?utf-8?B?cGVkUWppMVlQOG8xMXl3ZlZJeDFNeWJvb0lRb0tBb3Y3THN5Z3E5Wm5jcjVS?=
 =?utf-8?B?bkM1Tmw4L01lU2FKRWM1akRYU0sxYjZBSTNaS3FLN2VNU0JINk9TZTk4WnpD?=
 =?utf-8?B?V3JaRWxIdzRmQXNqR2ZSOEFYbXd6QnRJY0dLbnplaTBLWHI3VDdIVkd5MS9R?=
 =?utf-8?B?Tmp3c1k4MnRSUmxBejF6RWMvK3pvZk04aU9yOXdhK0JIUlJSdzRyNE96d3RU?=
 =?utf-8?B?bG9hS0V1ZmwyYllNS1BBN2Nub3pqaGJ3RWI4SVgyeHdrVDdBNmdBNVFtWk0w?=
 =?utf-8?B?aXo5M1hwS21YdVhPZVhKci9qbDZaUVJySWRTdWxnYTVkbWN2MXkxQXo3dFdR?=
 =?utf-8?B?MnZyL2lqemE1U3QwN1ZPWERuS1pCVDY5cG55Z0lXRzB6dlpobHRIUTFsbmtx?=
 =?utf-8?B?TWNlRTBwTWxJM0t6ZTBXdTdzU0hjME1ua0hHYjhvNGVKWmhoQmw3WXJEaDhM?=
 =?utf-8?B?OUhPb3Z3WDVBSVpBYjBCcTRxc2ZtZDhNWEx4Ukk3dTFzdHU2MGU3Yngrc2V4?=
 =?utf-8?B?cDNtNGlOdkFveXBlT25FSFBHWmwxQWIybTJ6dVlVUHpXRnFORXFjUGh3dFBn?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b439fc8-55b8-49dc-192e-08ddb25f3d2d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:07:07.5577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JxyKoxWzSpAyNb2Mb9Q7//V3TNA0uMTYAg1+pcGDMr2Ce223Rb6Mnt4S+f2j6yUa894dzJdP8Kxb2ooVZBiWzzke2Cn8gJW9IBM+igcDm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7768
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 14:07:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7155

Hi Robert,

On 6/22/25 10:42 AM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> if you check here:
> 
> https://docs.yoctoproject.org/dev-manual/building.html#building-images-for-more-than-one-machine
> 
> note the improper processing of :term: in that first bullet point,
> which is rendered verbatim as:
> 
>    Share the :term:`Build Directory`:
> 


Good catch!

Indeed, seems like it should be

*Share the* :term:`Build Directory` *:*

? Can you test and send a patch?

Cheers,
Quentin

