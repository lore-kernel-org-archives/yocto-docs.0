Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3468EE64A88
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 12:32:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web11.18194.1733229155400092124
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 04:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YTWMHMq0;
 spf=pass (domain: cherry.de, ip: 40.107.21.83, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxwCkeN5EyZzqtzGM52pcQjh5fXLRVvJMbZkzOpf4G6gnwukLMJfKNsJ1sP1kgFJxlA1NdRGv/LfaT86ofWyI+WcjqPaFBejNON245HEckz8amXBV2otWDejdfKhusIQCb4jbAe49fDg4Hm5m8OddnuKWKBvIGMuZjVdxIvQIezWrHdq3IlbA29/6hQHeQVfahIqLfB5xdjDi4Lcvop3v50EnZ4Fg5rpCUtlQbsqogqkmay7MSG56KkwR7pz+XaltvyNx5Xw9xCfZVzPcvWH68s5LOjYrGZOdgg9EtP6266JbPTofN8xZrkopm3LfPN2JUQFdU1mFTM9jKEGU38ImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96tQzvz5uHy4m4A904S6ohAbzvGrV2P7gufP7dIeHok=;
 b=NHCz+wLrczzTnVUZ3YGdzsL/20YJqAQFrN6yff3ptrSvZfxwNMxAkyiA3q9VqqPa2uBRdhZKMT2gFNtPZP6anszALu68fCEIRmj816CDasb4jhNkDc3bWndY/zyB6RYWDsPMASnKpQsoV+yK1fxtejO2kMjxw7dWhZDQNf+yFlRj3YOCHpZwxIs3J/hUnSZo6ovGin1OgqE7xxdwMtuE/LaWu2IS4/jZpRZjwbcr5qAX0CBk8C7O+sih9LwaMHoX3lE0Jrh7CWoD37WcjEBdk+W7tqkcj537bdrhxRDHGnAAIcXEWjUNH5PgSihqGt4f8sg010+JIax2ovViNLkqSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96tQzvz5uHy4m4A904S6ohAbzvGrV2P7gufP7dIeHok=;
 b=YTWMHMq04o3JCE2jrFgKcmXr/Rx6vzmmZ9hrTLKomLethTbqPTf/rohXUEQ5EbuLZ2VmRHC3CPvwUayfzTQiLgVghwR96sPto9OzOaU6Vt7x9psiDWLDwAobWs+1OFTouVxc0YDh1V6iiCW5fHJFfBFW2D1YnNBRcpq3GviKORw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB7198.eurprd04.prod.outlook.com (2603:10a6:800:126::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 12:32:30 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 12:32:29 +0000
Message-ID: <f16e162e-49ba-40bf-90eb-c9a0c2813ffd@cherry.de>
Date: Tue, 3 Dec 2024 13:32:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs PATCH] Add scripts to build the docs in
 containers
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241121-docs-build-dockerfiles-v1-1-3b54e1237bf5@bootlin.com>
 <3b8d482f-93c4-4ad8-ad74-6ed8365fcede@cherry.de>
 <D5YR4057DRW4.36YJYWAR7MRDB@bootlin.com>
 <D6208NWRJAPX.SPZ8IMGUAUZ@bootlin.com>
 <43178380-7636-4d2e-b964-a77a3759eae4@cherry.de>
 <D622A5PA7U5V.1PIP950OVIFYC@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D622A5PA7U5V.1PIP950OVIFYC@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d669d4-a19a-4191-87ca-08dd13968d89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WWVqTnhGWFJkdm9HVWx5TWFLOFF4UlFsbzF3VUNvYytwRndNb0swSUxrSXZW?=
 =?utf-8?B?b2U2SlorUzkvN3J3L0J2M2tJak9sb1JyekMvTEtKNmdFRTRIQit4R2RHNGRs?=
 =?utf-8?B?a3ZCK2pNbzYvZXBrbUphM0NnSUVUYXhtM0kzSGNzUHJ4YVUyV3dQQXFjZmpy?=
 =?utf-8?B?RlVDZDJBbU85Mm5mTy92cGR0WDhiMGNFREhZQkEvYlFRRkpBaHE5N0tIZE50?=
 =?utf-8?B?UmQwcXh3bU4vbTV4YmVsSEFveGlpdzI5WUtxQ0t0V1JSOFU2MGJKVzQ3Z0Ra?=
 =?utf-8?B?T1NkZm9POEw2eDJSMTlYWUFiTFFrYzE2VWI1N2hDcVRwUzY5MG1mVHJ1amVr?=
 =?utf-8?B?bWdVbUhhalRDdzE1Q2pBaTB1dTc4b1puSlFMYTZDWTI2RHlFMURGbk9weVAy?=
 =?utf-8?B?cW1tR24zQlFOa3VCRnBaRDNCdEFvY0c5eTQrRFJ6RXBSSklGV3MvQXBacm05?=
 =?utf-8?B?WTlWNDdQemVxZ295ZS9zeFJwOXFwRGxGdXBMVVE5ZGV4UWhxY1kweklyNi9F?=
 =?utf-8?B?TDlBUzJuNExkSzVLWHlCaHNCWEhXLytxYis5THRZNC9Hek1iMktJVXlEb241?=
 =?utf-8?B?OTR6WnI0SzVHRWhSSDc1clU2aGY4UUc1dUNhVm1EdWhRMjFJMm5tdEZyTmFT?=
 =?utf-8?B?UUNlaHVzY0lnaitYbU5CekNTYm5kdVQ0RlVBWXl6S09qM21QQ1MwT3puYVUr?=
 =?utf-8?B?RnVHclBHTHJnOUp6elhwY0ZkUXcyT1Q1RHg2cHkzR2JENGxYc2lFS0cxd1lu?=
 =?utf-8?B?OFVDTVFlemZtYzUyNWk3NklpNDM1UERxQ2c5OFdVenRCdzV1S2RvcXdaQ3hV?=
 =?utf-8?B?dnR4Yi90dlZFNTR3QXc2NTI0am1FUm15MTRGcjJZYi90bE9TanozZmI3b3dQ?=
 =?utf-8?B?dm1LRE4wWXEveWY5U01jS01DSjhJNGlJOEJ1eHlVNzNlTDhhcU1URGlnN0g2?=
 =?utf-8?B?eW5pcHVCaE1VaUZyV1drb1QrSE12TVN1aEtpM3AyWTFDTTVmZ2x2ZWtOdzBq?=
 =?utf-8?B?a0dQRVpZdEVEcmtEQ1plblExRjliazlKb2tIU3UzRTdzSnZiak95N0ZscExr?=
 =?utf-8?B?dWpZeEhZcjVSZ3UyZmFXdE5YM0VkL1YyMVdSeGM3MDJyejdzYVVKMDB0Z3BN?=
 =?utf-8?B?bTZtMldZMUNZSWV2eGsyUXppaTdnUUo2aFR3bDZwZ2x3NDdlL3lmVC83VEll?=
 =?utf-8?B?NmZPMmVheWpiUG8wZEZzdG95OWlvekpxYUl4eEdJQkNZaW9MY0x2RlgwVWd5?=
 =?utf-8?B?WlorRzdDM0FlV0UzMmhsUUNWNGNXM0lxUGpJeFJjSU1rcXpBOHRkVk1zcWxp?=
 =?utf-8?B?cDNoT0RZYVNzb1orNHI4bThrdVdCcFhWelRGbFBxdVJVUkJGQ3IvOUJXQnNv?=
 =?utf-8?B?WEVLYVVyVm9raFgrYU8xdW4yNG80UXBDdVdBL2dhV1dYR0JYMmZmTjV1OUVJ?=
 =?utf-8?B?VitUSHdQVlJGN3ZKN2poU2RqeU8yZ25tRU1ObmtlR1crQ3hmWVhuNkt2OWtu?=
 =?utf-8?B?RnV4WHI3dGloVGMxYzFBRGp1TUNtblh6Z0RQSEUxcjQ2TExmd2U2UEgwWFEr?=
 =?utf-8?B?UTJGbE5qNHpMbVI0Zm1NSjVHZkZnVnBVUm5USm8rMEFPNFpqNXUvdUxsRFJ2?=
 =?utf-8?B?VWhtUlEvMGpnK2k4K0JMOEtFZHF0b3FNb2gyZnViSzRJVXdTVlJHMmJwOVU4?=
 =?utf-8?B?ek1jMmJ2TWlDOENiY01vd1pFVFYremdPWmdaellBS3ZpZDNON0hYNm1iMjR2?=
 =?utf-8?Q?Q7LJomTgWGHx7vHqYc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cTdEc1NORFd1SFI2U1M3Y2Y5aFVZZ2FpMkx4Mkp4cE1KSlViMjlIL0pNbTdm?=
 =?utf-8?B?TGNhZG1iWnRFYTFPTmY4UDJLNDdkbitPOUQ0MjNCZTl3QUZTeXMxbUVMZGht?=
 =?utf-8?B?OHhWNlhRdS8zQStOY2NSZ2xrckRnbnhjUzlxZnpWWFV0RG9IZTlCSHU0K3pN?=
 =?utf-8?B?OE9HeVJEUTBZUExySlZYaVoxN1VXYlU2cHAxR1U5dysyaXlpVEwxM2N2Ym5G?=
 =?utf-8?B?UFpPcUkyeUFtL0g3SWpkWXU1alRsT2toSTBGK1dGOG1DTWJJdjkwbDE5YldM?=
 =?utf-8?B?VWYyV1NIZDFlWDNOdTRwdTJFQXQvWmcxK1pvSnVUMWF3OUZvSG9Memt2d3I2?=
 =?utf-8?B?a09iZi9QTWUxUDQ4YWpoRDdYQWkwUzRXS3ZWc1QxZEdLQXl1MGJGNi9kY3pZ?=
 =?utf-8?B?d2c4QVVvVDAwdXV3L0RNTDdvTVVLdXVFWi9JN2NBVDF1YzR3UXBYb0tENzFD?=
 =?utf-8?B?OGh5UmxudFBnYXQxMm1GNVcxTFBkeUlmNXd5amhrVkJhYkM2eDVSUExXNlR4?=
 =?utf-8?B?YTRiZ0dKZGZLNXhDdkV3ZGdFSWZOMDh1VUc3WXdYMnRKb2prSFkyRlV0a0FT?=
 =?utf-8?B?dGRjc2tWWU5TSnJwd3FCcHNXYWM5dXpsOUdFM2x5T2VxWklqZHRLeXlUcDJj?=
 =?utf-8?B?YXAxUkIrcVFQanQ1VHEwcCsydzVXMjVkcXFYdHgvOURBeVIvL2ZrcHhKUlV3?=
 =?utf-8?B?N1RmVVF6eXlzLzdpRGU5VVo5T3ZlbmMyWXQwcmZQSXNNSU1sYXNtWkR6Z3dC?=
 =?utf-8?B?TDA2eGVIRWgxSHJXTTFnVERTYnFiRjBBcGFJVHloVy8wSE9rdnNTS2tvRjlt?=
 =?utf-8?B?aGg4T0ZCQ1pzU0ZzS3FRRFNMZzg4cHR1dW5Ecno0WHJIQUJZWTVzOFBQUUpO?=
 =?utf-8?B?RG5vVXZOQU14aGNKclNScGtEQ1JqODhqWUJKdzRLcjBCaUJmRUtzZVd3c01C?=
 =?utf-8?B?L2xXVzNvejBINGZldmprZXpZeEpudVd5RzJ0QWU3RThwT3hVN2FjZERyQm9M?=
 =?utf-8?B?bDNLR2w1R0VTdXMyRUhCMnhkR25Xc1FWZEY2dDRxY0ZtdFBxMmhBWlhlTFFa?=
 =?utf-8?B?U2xmL3N6UE14blRGbk04RnptOWNIWG5wRWhRd2FGdUIwS1ZGMDBzRUpzVmZP?=
 =?utf-8?B?UU1LUzI2aFk5ejdRZzJ0b04zQ05SL01UTkJxRW4vZVJzOGloWnhXMEVMWXda?=
 =?utf-8?B?N1VKMFJianlNa2RIeEJqbTNUVHBrTHY1MEEwNmFjcXc2dFhJRlh1dHl6aDYy?=
 =?utf-8?B?OEZsQnhDZlJHY0dQaHV3VXRpeVZZeFJyRi9UYk5FSzZYczJ4NXU1V09rbVd1?=
 =?utf-8?B?TVJZRURLQXlrUFB3QnFJYUtkbld2NnMrc2EzSDlnWDEwMGlIRWNxeFg3b1U0?=
 =?utf-8?B?TldnMDFCZ0lJYmtwb0JsTFVNQ1JFeDBQOTkzRy85Q0RyVWVFNndwUGZ3RVYx?=
 =?utf-8?B?Wk1JM2ZFdnRSNW9rNWpwMnhtRnY5UmxvM00yczcxQVVmWHpNNGxKcEVtbGVU?=
 =?utf-8?B?Q2Y5OTJmQ3kyVFZjWUU3Zzd2SkpMUlk0R3diT0p5V1JkWXBpaDBSQWZkcDVy?=
 =?utf-8?B?WGEzSVEvTkxnclhlU2hBZUN4MDZkTGhSK2E3VGdSUUVxTEpHenB4WkVsZERB?=
 =?utf-8?B?ZHk2MnhlUGJjM2lBUEdWcUt1RXNPbFVNRDRoajJLQ2tKNGY4dlFzWmJ6MU9h?=
 =?utf-8?B?aXFpT2l4R0Njb3JKdTJXcnVtR2w3bURESlJiUDdCeXNaRkErVTVOVWtDYWFV?=
 =?utf-8?B?ZGRWOS85THdLN0pKTHJDMzNsS2x5YU1qRFlJbTZUZHRRM0MwTTluYmtTejBj?=
 =?utf-8?B?Y0c1eGxHMTM0eXRnOUQrMWp2Z0ludVQrWUZGVVhoMldjaGdINVIwcE1YTGpj?=
 =?utf-8?B?aFZaZjVCKzk4ZlpmSTdNbUM2R1ZQTHpldU04T1V2bnlNV1VUM2FiOTNub0Fa?=
 =?utf-8?B?SDMwNGl2SHJvU29aakpIVjZBbDdhTHgxMGxJc3JxRjl5MUlWK0doZnZuTDJ6?=
 =?utf-8?B?bG84ZnZlVDVGeU9HY1VETjVrYmFWeDVFYlZSU2JPUTdOZWswUWFLQStmNEIz?=
 =?utf-8?B?TEdtQUkrU2g4dU1vclI1VlF0Z1RLd1I5ajgwdjEySEJmVDIzNytTY1ZNMDFj?=
 =?utf-8?B?ZWIzVVBndDNBVDdCcDJldS9PeGc1MXhYZG5UZ0JYM0hDK3llUjJzNWtvMG9D?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d669d4-a19a-4191-87ca-08dd13968d89
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 12:32:29.8666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxpPU7T4dx1an6Q3g3FN27swxiZhm0lK7wylwsaURbqFfuBPSI19/Jrs0R+wPF/5Yo+ZKF4TDugzM56IkbbQsFeIfN+rx3xAaeFL//Wt0AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7198
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Dec 2024 12:32:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5869

Hi Antonin,

On 12/3/24 1:24 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Tue Dec 3, 2024 at 12:37 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 12/3/24 11:48 AM, Antonin Godard wrote:
>>> Hi Quentin,
>>>
>>> On Fri Nov 29, 2024 at 4:01 PM CET, Antonin Godard wrote:
>>> [...]
>>>>>> +  fi
>>>>>> +
>>>>>> +  $CONTAINERCMD run \
>>>>>> +    --rm --interactive --tty \
>>>>>> +    --volume "$DOCS_DIR:/docs:rw" \
>>>>>> +    --workdir "/docs" \
>>>>>> +    $EXTRA_ARGS_RUN \
>>>>>> +    "yocto-docs-$image" \
>>>>>
>>>>> please prepend the image name with localhost/ to be sure we don't end up
>>>>> downloading some yocto-docs-ubuntu from docker.io for example :)
>>>>
>>>> Nice tip, didn't know about that one, thanks :)
>>>
>>> Hm, this doesn't seem to work for me, and I couldn't find anything on the net
>>> that shows this. Is there something I'm missing?
>>>
>>>     Unable to find image 'localhost/yocto-docs-ubuntu-24-04:latest' locally
>>>     docker: Error response from daemon: Get "http://localhost/v2/": dial tcp [::1]:80: connect: connection refused.
>>>
>>>
>>> Building an image named "localhost/..." will work, but I think it's just
>>> building an image with the name "localhost/...". Not really building something
>>> local.
>>>
>>
>> $ cat Containerfile
>> FROM debian:bookworm-slim
>> $ podman build -f Containerfile -t test-image:latest
>> [...]
>> $ podman image ls | grep test-image:latest
>> localhost/test-image
>> latest                b2ac1dc43440  14 months ago  156 MB
>> $ podman run -it --userns=keep-id localhost/test-image
>> qschulz@e706c5542422:/$
>> $ cat Containerfile.from
>> FROM localhost/test-image
>> $ podman build -f Containerfile.from -t another-image:latest
>> [...]
>> $ podman run -it --userns=keep-id localhost/another-image
>> qschulz@4e1f3229a196:/$
>>
>> On Fedora 41.
>>
>> Could possibly be yet another difference with Docker?
> 
> I think that's it. Supported by podman but not docker, as I had no issue doing
> this with podman in the end.
> 
>> I couldn't find a way to force fully qualified names from the CLI (one
>> can do that with podman on fedora by removing
>> unqualified-search-registries in /etc/containers/registries.conf I
>> believe). I guess maybe --block-registry '*' would work, but still not
>> sure this is something supported by Docker either, /me shrugs.
> 
> For simplicity and compatibility, I guess we can leave it as that (no
> localhost/). In the second iteration of my patch I will merge the two scripts
> into one (also for simplicity), so there should be no way to reach the run
> command without actually building the container prior.
> 

I think it could still be possible if one pulls an image from a registry 
which has the short name identical to the local image without localhost/ 
prefix.

I tried with:

1. podman build -f Containerfile -t sean0x42/markdown-extract
2. podman run -it --userns=keep-id --user root sean0x42/markdown-extract
3. podman run -it --userns=keep-id --user root 
docker.io/sean0x42/markdown-extract
4. podman run -it --userns=keep-id --user root sean0x42/markdown-extract
5. podman build -f Containerfile -t sean0x42/markdown-extract
6. podman run -it --userns=keep-id --user root sean0x42/markdown-extract
7. podman run -it --userns=keep-id --user root 
localhost/sean0x42/markdown-extract

2. would use my local image
3. would use docker.io's
4. would use docker,io's
6. would use docker.io's
7. would use my local image

Not sure we should care that much about it though.

Cheers,
Quentin

