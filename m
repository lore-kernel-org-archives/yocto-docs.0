Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E724C4743F
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.89])
 by mx.groups.io with SMTP id smtpd.web12.6988.1650624059437171824
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 03:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=hjd12JyQ;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.21.89,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kryLxOKurRX7jb6Ru4n1BcRtgY1UD6Vss2fWo95zDQT2ocAP7mq/MEU61MfYZQHzEPJoajJTyCTOhTx1ayYuS8T8q1fF1HjXN6DBvrPoOg8Tt4XYr1x64JbdyJSv86XLkta2Yld8TqzdqfahxY0i+IrafcTIw0GO2ELcwvoEvRVKlyY7qiSIR5iEkaSRgC9kPlbmGkpxLbrmo0ZBznd8UePYu0403ExHHhv/rKjJDUiXYJb5zSN07Iu3op3wElj4Do/73oKATeeHroWE3A4az1NBhVIaN/yG8W5928NFLnCl3gNS1AHHGfdE3W8hEClc5aJcK4K2AsfCYkp8Z5i4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go6vsoio6a/ZUImq+rHeByHntYICVnJqVkbKoeMSViA=;
 b=D4zx0QtMPuwVSaOI7oTcBD4Lsf/c/ZyAswI1jFokmvOPNAkHqRyiRm6QKYTDYj21+xxOZxB9aD2xmTzxIfsmDs5rtZ78EY1LONkTv2o0ZEM8/UjCOk7pMwBdTDoUb5NDZ75fNNTzlGS39ixA30si9fRm/pk5VZ1PTeYWq940yh8bIlACmqXcaMKk8Zu7SEq28fa38JrM5bgwsaQCMFhw233InlhH4l8oNsmHrlPREV8X4K6TfmEidgLJYyMEDzk29xg22l2YbSaBrQG0XHamRRDZKblyCTkIcNnI6c9E+AF2dkVWI06AlKhnGzOZqkXiVtrmGSEZNsuW1jg9q79PgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Go6vsoio6a/ZUImq+rHeByHntYICVnJqVkbKoeMSViA=;
 b=hjd12JyQodzUDgOPFtxoebbCOAqudUZLe8iDxyXPccCTteYOk6TfARrl0tjQMQDrzZXwMs7wddGk66JtN/05i7vcOVDdcyrQKo0TmHalARbrNKI3psDxnJvfEGXNmJA/wCs45GFpNCDQxRJNToktCdUXFEUt2SxMTEuW+Lw8ONE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AS8PR04MB8261.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 10:40:56 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::e448:c9d3:fa5b:2979%4]) with mapi id 15.20.5186.014; Fri, 22 Apr 2022
 10:40:56 +0000
Message-ID: <e843b4b7-3a45-d44a-c423-c004151a32c9@theobroma-systems.com>
Date: Fri, 22 Apr 2022 12:40:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [docs] [PATCH 6/9] ref-manual: add XZ_THREADS and ZSTD_THREADS
Content-Language: en-US
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
 docs@lists.yoctoproject.org
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
 <fde984bfa988c26cf7ef4cacf4ac830d974129b0.1650591341.git.paul.eggleton@linux.microsoft.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <fde984bfa988c26cf7ef4cacf4ac830d974129b0.1650591341.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::29) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f3469a-caf3-44b0-3a3e-08da244c94f8
X-MS-TrafficTypeDiagnostic: AS8PR04MB8261:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR04MB82617D91B15D42CDE3C3002CC2F79@AS8PR04MB8261.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iOGivkAgFS4LAp1xN8B70GhO21G1BIj7g3u1i9nKGEKbBIntjlk+NDYAtasSo1aCeY3CrfTxRNma58LRtTZWJL9uIn4eBWCVGzx6i0dHiSJNkDPAbI8AdhWDSQgFFYrT+jpIUgP+1upOz0mMFpMhaHPEwxTgXut5zlE4cOq128+oo4Bo1DCXOxsdwgkNHUjZOXGFt1+JDgpq5PiwqFlo1caTJ3IuuYItj4831/kUNQjeaGiXPOTYW4EC420vtxhqD6hLNtpkBTc9bA1zFc/7zX8SMRhDZmY6t4LkLnAZMXrkD5ltd7UttERqF7tzAAA3W7fe+iAAF4g/qmQZyx3cvYOAsIuIvJxOjFFRmK+2UlDdPRdUfEKOcL4M05BU595f4Z8dlifV+K+M828GxIzQhPDks214KQiJBA+li0jNcJYEaixlYrVY4pOQrpySQov8uN7uEHz4nRh2qyoM7WU4qczpBPI1a8jMw4tabGSXDCJVkk0OzEF0YU4iAl8hI4jQOh2CShhzfa/HxlywAQhxx38cHyubhzKh0innLwM65W1E1GQ9v9NuauqUuHY5Z3+uHHYFe5Pj2tSHBbyAs9YMMCBGJl8K8NRqVXDFnKHy9eg5R9o+0j73Ks+tATJnDQm7Mxk8NUqI/2xvmz2so/Ohrjzz4gBX+pWWiztdaXeoSop1GS0arWAGH4OmueHvaKecHFaOGtK+EUsD5uqxih2Qf9kWWJsaoPFWcNaF9BZ2B+I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(38100700002)(186003)(83380400001)(2616005)(44832011)(2906002)(6512007)(36756003)(6486002)(8936002)(45080400002)(5660300002)(31696002)(86362001)(66556008)(66476007)(8676002)(66946007)(316002)(6666004)(508600001)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R29kaU1LOSttYU92TmQ1RGJnNHB1UzVlcitGeHRxYTByZ0hnV2NoL1RGajRW?=
 =?utf-8?B?cC9BOVdoSzZXYmIvQWJkMloveVJOVVc5VW5hVmpFZHVTN3F4ZFVzckpZeFEw?=
 =?utf-8?B?eWhRckw4bGhkTldoRU9sR0g5eThzYmhmSWpjbHhRRnlXT0prUVpleFp4YlI5?=
 =?utf-8?B?cy91WkJZdDRLb2JNUHNPKzFFUHJYOVhTMmgxbFdBc0VNb3g2RkZYSXY0bmdX?=
 =?utf-8?B?a3o4cVlGWmcvWG1aRGZoS2xkaDFpNjF5TU1TNCtJemJ6ekRvVWFHY2kzRGZT?=
 =?utf-8?B?ZEYvSS9MR0Fpemx2eGxLbGI2dDQyT1dyZjNSYlpYVmZCY1pkZzJaVXVNWDRB?=
 =?utf-8?B?dkxnVytzaDYwUUh1WGhmM1RMWlJWRU91UTZidEtkeVhwU0o4b0pHMXhBNGs3?=
 =?utf-8?B?YzZzdGZPMWxUVkNCSGZZVG1ic2J1b0w2RUhKaFBFa1FINUtVa1drTWhaRTR0?=
 =?utf-8?B?UUlFcjhwRzhSMHJ1TFFna0VQYmlTNU9tLzNxS2RJVGU3Z1lIY1JxQ1J5TG0z?=
 =?utf-8?B?S3Y3YVRBdVF1U0FLcGpyYnU3THkyZklWU3lLaWJQNjZKUUxyckxJdmx4ZHJW?=
 =?utf-8?B?WmtrVHhIbURXUDMxSEs5bDMwSXZHQWxmRWpJSTZyTzloajQ4WDUzY1BZTDVP?=
 =?utf-8?B?UnJSdEFQUkE4VmJUWGJiTTZxVDJ5RzVubkpWR1pLNGJzdGJiQ2pPUUlkN2VE?=
 =?utf-8?B?bTFDM2JhUC9lbFZtNTRrU2dwTFZsaFFWdTVQWjAvbHVEYzJuK3Z2K21WeThX?=
 =?utf-8?B?d3VEbzI3ZEZCWDdSQ3JqTUJXMzlRU05kb0FORXFsUWV5bThZTnNVUTk5dXMv?=
 =?utf-8?B?azViL1c1d3BObms3UlREZ1JVRmY2WVlISEZub2RKVTFxdVg1TUh1bVNMVE9a?=
 =?utf-8?B?a2tGckk0SnAxTjNVbXZsUlVYcHkzbE9scVZQZzIrUlc4VU10KzdoYmFhOXBp?=
 =?utf-8?B?cENqMXVkV1lQdy9tOGdGdTVyK0FCZUt2b1M0YzdnbitkMjVhUnlRQldxNUVO?=
 =?utf-8?B?OWJ1eDFjV21OWXpCVUR4WE85MlpDbDFyV0YxejFqNkkxR3J6MlNiQWtCd3lh?=
 =?utf-8?B?Znp6VERxbnVXL05yV2xGNzBRODVYZEpIeXJiSU9zSm94ZDZpNmc1eDR5Tmtm?=
 =?utf-8?B?QXZsVEh0VVRCQ0FsbHMwZWVUVmVNdDR1aHdFNzEwSmU0d1NZdTBiZmVMd3J6?=
 =?utf-8?B?U29HaVlsdW1lSkdsalZuUnU3R2VsUG11VmZZeXk4dDNydmd6WTRKaVBDdEdZ?=
 =?utf-8?B?cGZhT051QUNXVmVkd2JDY0hBZWhwV1NscnZJeUdIRGNIYjN5QzJDOVh2YVA1?=
 =?utf-8?B?eVRNK3o4Z0J4Y0U0d1Y1M2RlYVhIQ2xnTzV5M2RQWFhydXM5bGZ2cnluYlUy?=
 =?utf-8?B?b0tmQitNQXNtSG5LcE1WQmo3UU9VZ3A0R0MzNXIvYUFaZTFNTkdXVTZNdkx6?=
 =?utf-8?B?SVBUTENFV1gxbTA1TTFlcWhFNmdnZmNPcU5iMXB2UnNuN2hHaHh2L3BjQU01?=
 =?utf-8?B?alRiSlVVVzVuaWRtdVIvY0hPcFNSN2RVa3NJUkVaMkx0c3dqa0x2dXFkWGlt?=
 =?utf-8?B?Y0dtRUxwdGV6bXpzcUpKRVowUVJMV0VpbzJZMFl4ODNzL1U1bzBhVy9yZmdz?=
 =?utf-8?B?bk9XckF0YmFEK1l4WUVPUFE2eXNKMnF1dEFrbXNnTkpScTNCbHBtNHkyMFVR?=
 =?utf-8?B?WGs4aThHN1pYdjZwUUtBRjJTbUJKZlpCTWp3K013dlg3MG9GNW5rTWMzanFB?=
 =?utf-8?B?SmoxczY5Z1dVd0pMV2phdUdkTFI2N3kxVllJWVF2NEQxUlJ5MC9ZRktESXFH?=
 =?utf-8?B?YXFTRStER0xuQ2NZYk5HS1ZoRTYxTUlRL0xXYTRMTWZRc3ArL2wwMmpWSHdC?=
 =?utf-8?B?cnFHQ2VNc0svZDgxVWlpOUNpdHdNKzFJNlNGWUMvTDduQi91M01QYXZDSUhz?=
 =?utf-8?B?VStWZzlPK3k1THVocHpzbW0xRDN3aGFqVExDL2t2QzByYWxpRGRvVlRXWFo3?=
 =?utf-8?B?UXZodzV5L2h0ZVJiSUltcHZtOHdqeWJCUnhXUGkxVGpzTUhLN1hxajNtQUtY?=
 =?utf-8?B?RTBiVHZkZGRaU1VZWE5ReDBQNEhNbUgvQmNOLzJjMHR1bkpGMjJWaU43QzRY?=
 =?utf-8?B?dEEvVkg2NW90NlNKK3ZzTGdZR3BGOXFLVGthYVlYcVhNTGQ1YnBoMXc5S05V?=
 =?utf-8?B?VFpMTzQ5R1llVDhnbUVDWFNoS1BoK2prdGsyVzNCK3JFQ2pVcWRZSXM4RFhp?=
 =?utf-8?B?WXFTNDBkbXdMRFR4MHI2c0N2VDExaXZ5enBaR1VlaTRnc2ZkSFEzbU51Q0hn?=
 =?utf-8?B?TzQ2RnpCbEw4SWR5SXhiQ3NQVUgyOFhTNWh3cmlpQVlZemxibll2YUVYNm5u?=
 =?utf-8?Q?uXxQPs0YsLexy9xiiS5miPmA/EOaZadBxXmXyrllxoM7l?=
X-MS-Exchange-AntiSpam-MessageData-1: pIKWZAGNYqIWSbeZap33LWG7OtAOres6C2g=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9f3469a-caf3-44b0-3a3e-08da244c94f8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 10:40:56.3006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fcy3tO9wWlKvqMP5LzMQwwyaxPIVlVRmKuiIZvn7brFJdRpRQNCCOFZwOne2KknI2oVa8OLMBfVaIr4klYZswQUJHU1JkVNqE8BOsmIkliQvo6JWddTV3g9agaJJacQI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8261
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2835

Hi Paul,

On 4/22/22 03:40, Paul Eggleton wrote:
> ZSTD_THREADS is new for kirkstone, XZ_THREADS was introduced in dunfell.
> 

Separate patch please so XZ_THREADS can be backported to all branches up 
to dunfell.

> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>   documentation/ref-manual/variables.rst | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index b9448b8..4803578 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8737,4 +8737,15 @@ system and gives an overview of their function and contents.
>   
>         The default value of :term:`XSERVER`, if not specified in the machine
>         configuration, is "xserver-xorg xf86-video-fbdev xf86-input-evdev".
> -
> +
> +   :term:`XZ_THREADS`
> +      Specifies the number of parallel threads that should be used when
> +      using xz compression. By default this scales with core count, but
> +      is never set less than 2 to ensure that multi-threaded mode is
> +      always used (so that the output file contents are deterministic).
> +

I don't see how having it set to 1 breaks deterministic builds, do you 
mind explaining?

Also, this feels like explanation of the implementation more than what 
the user should do with this variable.

If the variable should never be <2, then it needs to be explicitly 
stated here (and eventually the reason).

Maybe it'd make sense to explain why would anyone want to modify this 
variable (which IIRC, is for when you have a nproc/ram too high and it 
OOMs when creating packages).

> +   :term:`ZSTD_THREADS`
> +      Specifies the number of parallel threads that should be used when
> +      using ZStandard compression. By default this scales with core count,
> +      but is never set less than 2 to ensure that multi-threaded mode is
> +      always used (so that the output file contents are deterministic).
> 

Ditto.

Cheers,
Quentin

