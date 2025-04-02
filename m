Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA58C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:15:49 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.61])
 by mx.groups.io with SMTP id smtpd.web10.3955.1743585339892032101
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 02:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=oPBR+5zH;
 spf=pass (domain: cherry.de, ip: 40.107.104.61, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcuBGQbvnbKX3wAmSyJAzV0XR+tmcY37tcQondZNRwR8IqsCLbFmanh1YT7cjw+C6/+qwqmRzQ3ey2HO/82PUDL1dxdUK5cXiwXrw/q8ZciA7rS+ZlAtWzDqnLIodhLoRWwVQh7zDUUnNarLCCdcQi9VaPAVwyqIVuQTx0eOEp/bK/jH70RoURmQ4di0uQthJa0YEa98fwAm1GGU4Jv3wYzkQs/d1vkqGkfV7ADzjLefhm95f+ithubDVRu/LAAei5nGSpQX8ph351e2RuJ9doi6d0hac5Y8KTYqTcr8NnbpJBX7xdQq9JTTWoaW0AbZCkgW4SrG1UzJ77wcZD5y+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20Vq5F3gUqptb2+cg59drgW2mFcWLmr/KaINGCzCKsE=;
 b=g3pM/8079UqfZ8bdl/PeiteRjBqxcgQ1FmtMdt19MjTL6ZSESI/TNxOTX7YjugK9X6a+3GlcTNRBUpFNaDsYBUKm/K88i6d/9GzGjMzzihLiY750Lm+LJibSmNnBk6mO71PO4zDzWOZoqWHucs0x8fw8+Ci91wN0o5onPIGgqvkZ9t5DiK46HjbKz5XQBAg4ROnGkq6qcJ/ZsDQb8jzxOhKyHzrUtHvVC5Zk5WJBpLum+H7kZwqwDiAZEHJYjqqA1ho5hDk6y6YIbWpBAYU4oO9sNrgHYTieW5LOWGJX1gE0DAcEk0lTYrXAhmiPdUMdZo3C4o76ALtTlbpqJ9rLOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20Vq5F3gUqptb2+cg59drgW2mFcWLmr/KaINGCzCKsE=;
 b=oPBR+5zHLg4LoCanAtTpD3Oubo1HoVcavc0U+QdQd9EwGtYTx6iyH3+0djGP81Tbt2Fpa+CJU6MoVDVDZc12tIXsfEf3JMiJysen5NhELkcjgbWUdVxI4hchpy6zYSxCcdTpXa9pWw+NksrvePvmduW9BaoHZlxbmCyl2JpHBAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10394.eurprd04.prod.outlook.com (2603:10a6:150:1c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 09:15:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.052; Wed, 2 Apr 2025
 09:15:33 +0000
Message-ID: <91b88e04-a330-4ebc-8694-e971d1471ec0@cherry.de>
Date: Wed, 2 Apr 2025 11:15:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual/variables.rst: document the
 INITRAMFS_MAXSIZE variable
To: gavrosc@yahoo.com, docs@lists.yoctoproject.org
References: <8404.1743413076577523364@lists.yoctoproject.org>
 <16450.1743536598761017631@lists.yoctoproject.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <16450.1743536598761017631@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10394:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a995b98-2a74-4ae0-a175-08dd71c6ec15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vk5HUE5wNXJ0dzlmREJSNGxoUUFPS2RmMThrK0orWFBVMVAyYk5KWHZXODEx?=
 =?utf-8?B?UEJFYXN0Wnd4Q2Y2N0VZeG9qU212TmRJRmpzRWQvcFVoTTVvNU56eitWMGVB?=
 =?utf-8?B?YUZ4ZFNjTStidmNqaHRUL0hSNWxSZkhmWmV0Wk15TWFRSzltd3NaeTZ2WGha?=
 =?utf-8?B?SFZoUjk1SUVCTDFRSVhVNkcvcUFkWWdvbWJuUlhoaXJLTTQyTytiNDdjSWtG?=
 =?utf-8?B?YVFITVpXT0oxa1BDZ01aT3g2Uk9Rek1nS0RFbzQ1K253N0lIeEN5eFpKTjBF?=
 =?utf-8?B?ZzUwaHYvTHoxck1nT25tbmNOQkZsKytXbStpWkxva3hrdVZ2WmtVU3h2YjVq?=
 =?utf-8?B?VVgrNHZnT0dwTVQ2V01PZ3BadVVFOW8wcHphOTI3NVFscHNhZE12dUR0L2RM?=
 =?utf-8?B?SjV2NGtvVlFPQ0JiMlhvWFljbVZQMEZVSXdHMlNHS3hsejVXUEdpejg0ZVNr?=
 =?utf-8?B?dzVSTUZFUEhaTmRCSFRqenA0L0VqVE83Mk54WlZBS1NFdVN5Z0F5N0FwQk9D?=
 =?utf-8?B?SlFQL1BJUXZlL3RLbmR1WGZuM0FyMDhMZEZMelQ4ankyc1BqdFpKSzFFQUMw?=
 =?utf-8?B?QWg5Zzg4WVBsZ1ZWWGQ3Y29RMDdHa3lkRkdhUmZaRlJpWTBwam1oNjZNWU90?=
 =?utf-8?B?K2V3NUVRTzRyWHFPTFF0cDNwc2gvOEpXVXUyeVJVUjNHcndudEpaMzZjVVha?=
 =?utf-8?B?NnBoZlkvY2NtZXpOUWlkeXFpaTZvYmVKZzN6S0ZkeS9oUnpPV1NHYnlzK2F3?=
 =?utf-8?B?L3JxcW1kUlorY1FZVSttN0lieFhDNkJrTXViN1RxNzBuL0txMFdnT3VaK0FM?=
 =?utf-8?B?T3dzeEJVdE5FY3FJSDBOL1BVcXYxNEtlTnNGVE80YUNZdGpWTFcya3BUaitq?=
 =?utf-8?B?M1V1UDFiTitPd2Fhb1NVR3BSNkRVU0kvcEFPdlpGNEJwelVuMDhuOXEyVFJ0?=
 =?utf-8?B?NHB0YUprak1KRk91UjI3SVZnUDR5ODdVUU54WWtXSGtjUEkwTk9GMzAyVmIr?=
 =?utf-8?B?eHQyOUd3WitNa1BCTlh6cFdYbHQrMUhaQ3NuL2dHaXFZcmJ5WnpYM0VIOWpn?=
 =?utf-8?B?Q21HVXpwM2RFaVdjSXI2Q0dBQmJnZDVWWldiTjhFcmFmUkZUZU5NOEY1MmlU?=
 =?utf-8?B?RG5mZXlzRVJPcktsTW9WTFBRNXFOVU5aVUZONmdIUHNtSEdTbjJqeVA0VTZ3?=
 =?utf-8?B?TkNMK2MyczRvU0dGNmtJWDlQU2RiYmlOR3pHNjlGVW1kK1RCYlJpQXNqODg1?=
 =?utf-8?B?ajhndDVyNzJNMERjbHdLck5RRW9SdFh4M3dXT05pS09XdGpJbVdzMktRemZR?=
 =?utf-8?B?T1pab3haMDFMNG5KZ25lbEgydEkvZjVmb0t4U0U4Z1FJT21LWC93M2lTMisr?=
 =?utf-8?B?TjFUemJyUHlGcXg3a0M3WFNIY2p5K29aZFVEZVJHUTFTUGI1NENjOEhjWU0x?=
 =?utf-8?B?Z0RteWtIN1Q3Vm01Z2RkMnhTcjd6d1VDWnhFdlNBVDZ6b09XUEpnOGpETW9z?=
 =?utf-8?B?cVdLNEZUL3lPZktaK1RqVnpmM0FNMnM0ckllR0NMUkhYMkhRc2ZpUGN5TGpm?=
 =?utf-8?B?Z3U4WlV0TUsxaUVIQzNaMWN5dkZTM01MU01jVGd1TkVWby9SZS9oeEFqRXVE?=
 =?utf-8?B?UER3cHNaTFgvdWxON1VPcFExVXpyQmNpeDErQzBGaWFndzNwUFRLWW5tNmQ3?=
 =?utf-8?B?Y3cwTFo5TVRXcDV2STJXYUVvQVI3ZzF5cTZBNldaa2hHVjBvaitpTjlhOTFr?=
 =?utf-8?B?WEJ5SDdMT1AvelVaaE9Kbzh2ZlF5SGxBTDl4VGYvcmllci84ZGUybEc5Ujkx?=
 =?utf-8?B?QWpYcGMvWnpXRkZ3Qzl1dUdFYnRXdXlidVU1ZTljSm5WNUVVcTNSS0xrMkRi?=
 =?utf-8?B?c3M4eXhUbTc0TFhXMEgzb2VRWFNKZkwvRkNiWnpYUDl5dlJST05XSklPQm5o?=
 =?utf-8?Q?JInWuc+kDOQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WER3N0ZUelVCMldXL2hibEhuV0ZFbGx5MHJKOGo5VGJVZlRycytRdEhEVGhu?=
 =?utf-8?B?MU9ac1poNmcyOWNtS3J1dmpHTVg1eTNCTGZUaXU5ZGNHSnc4Ym92U2hHTEtx?=
 =?utf-8?B?a0NyWldWeS9UcHJnbk9aT3h1VkpXNnp4eGNvWmxVVGRWQ21VMGd0STl4Y0FQ?=
 =?utf-8?B?RWl0WnQvVGZJaU9xVDl5bmRtajVuZk85aDdFNkVVTml3TzJNUVVseWpXQnRS?=
 =?utf-8?B?RFBDRFZJbnlwUlJJKzU3YkZYQVdUREE0RUR3ek05TXVSOHQrMlQ2UVAxdHVI?=
 =?utf-8?B?c1NqdDI2RUI1NnhxcTRraUh2QnVzVVU5MTNOZlJqVmNyRUpPejNzTk9ieGNw?=
 =?utf-8?B?UTJvVG5MUHdadC9KeEJ0blVyVjNqd2p2dUpwMTJyckVCSG1hQVBQbkwzNEt2?=
 =?utf-8?B?NnozVkhIck16K05leHZjOWNrZlF3RmNhMWUydnk1eWlXb0RNRVdVclI2RWda?=
 =?utf-8?B?Zjd2WksxZnlmdGlsWWRqd3JkbjFUb3FpcEZDRTh4RUxxcjd6eHRIVmcrOWZU?=
 =?utf-8?B?ZjlsUTJOQmFOalhxLzFQRXhlZm5KSGpka1A1ajMySkZSVStib0x3VzZNbDlY?=
 =?utf-8?B?SU5MUktrRFZhazFEKzZXSTFrcmhCSmttNnBhNlg0U001QklyeTVGZkZUSmdw?=
 =?utf-8?B?ZExaTUZRdWlBRFFYTGdUZzlCaUZNUXJZdHU5RytUUHVGWlQ3RWZMMEVURGFL?=
 =?utf-8?B?UkZLUmd5aDZjMWNhK1dTZTRLZzNxd1BhR055Y0s1TThRVG8xSHkwaGhnbFVF?=
 =?utf-8?B?eW1sTmJnMi9hZ2hQRmp4b2pmQXJhanRiV09aN2RXa3p4YzhqSFlMZkdYVVdG?=
 =?utf-8?B?Y0lkWE9lUFNuaUZqVUY5ak5VUmhYSnFxeW9hcWdJS0U5MUpOWGNaYnlPOThq?=
 =?utf-8?B?Q0xjVlh6SHlXRGNKQlNZQ1NiSm5mYjVhWTc2YWhCTzJPNFJ4clVnakRWYUZV?=
 =?utf-8?B?N1Buc2JzZzdURzZBU3lzeGl1dERQc3cxMGwzaE5aQjZaV1dkN2oyaU1HTDFr?=
 =?utf-8?B?ZkVER3BLaU5Mb3JsMkNsbEZXMHZlT2xkNUt3a1Jxc01zNmtjeTY2dG0xYzB4?=
 =?utf-8?B?L3IyTjBCT2ZnYk5CQ1VtOTVsRVZhVndZS2tndUMyL2JOUnVSOGZlUnpZcjRV?=
 =?utf-8?B?L1FjR0MvTmlieGgwRnloNnBwYTBYODIxc1haOE5TRzNaMkYvQWhtYWZvczR2?=
 =?utf-8?B?L0wwU1VNN3JPY3E3NFdGZytUK1hKM0VwWFhqUTgwNlc5RXVPclNxNndaV2Fz?=
 =?utf-8?B?Ukx6aEdmWkVYd01sMU50WkMwRFFSWUd6eGVSL0UwT05tZjJvOTg0V0U5MVR4?=
 =?utf-8?B?M3ZvTnoxcHR0cXowTnV4WG8ycHhJSHZjK01kaTBXWisvMUFNQkZNbHk1SWJW?=
 =?utf-8?B?akNjZGJjNEdiNWdzaXlSc0l5dG5FallWdm1DcS9ZNkhhUzdvdGlFTXRWRDBE?=
 =?utf-8?B?MEtSMWdRWlRyWDV1SEpiUU1BUEJwMTdTN2syOFBkeDdJUzEvQWtzeXdqaTBv?=
 =?utf-8?B?Sk9vNnNpeFFKTFB5R0FTbXptYTJnVTd1TmlCbG5Qd2N4cXJ2andoMmRScjg1?=
 =?utf-8?B?NkNadW1VbE5qbDVhcEVTRE1DYk8wYmUzR2ZSVDVCcTEzY0xncWw3djBpTTJr?=
 =?utf-8?B?U21YRmNRMEFXV2dFWE5DMkZlL3JKKzJPUms0ZjlFajVodGgrb2NkdU5WWUFK?=
 =?utf-8?B?WE56bnZtd1J4bm5uMkdYNzA4OTJHR1AxWmd2MmpmZHZJeWUzaDZzSlBFSDc3?=
 =?utf-8?B?eEFnRjdvWGVCK1ZsbTB4Yjc5UnU2TTNlZzh2KzVaa1d1T2hTaThwWnRwek81?=
 =?utf-8?B?L3B3UGFVWUp0K1hVblFvMElBWVRRRnpMT0Q5MXRmS2x1bzhjTllFUUt6WjM0?=
 =?utf-8?B?OXVKVGhnemZ1dG1WOENjTlQ2YWduV3ZIVW5LdGFqMjVTcHNaaWJ5ZnNDS3Jp?=
 =?utf-8?B?TElHRjJLREUyL1FrQ2FDSnpHZmQ4ZDRhOG5YdWorR21iVVlTNVpHVlBPMjFo?=
 =?utf-8?B?OC9EWno2VEZIMWFmMGN3T3VEek5sRFU5eHBxcDRxSGpJK2FBVFZUMjZiWkZo?=
 =?utf-8?B?dWtNSlBZQTVWeW9VVTJ0UU5uWG9Tdjk2aUpDU0tuT1FOeTF6QU5JVysyYm5w?=
 =?utf-8?B?ajAyZ0tXdHJoNHRJV3oyTG45SjViME1rUXd2NE51MUZJb3VMSHU1ci9JY1Jn?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a995b98-2a74-4ae0-a175-08dd71c6ec15
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 09:15:33.6673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMtLVMA8miiirKSg3k0Y+fOjP/0YiRTljVvO45Tiy1JkPv0nuc12YK4Oq54o7+kz8Ilj4X6Z/6dmyH9pdWIM0YjgyvBbiWMh5fE2jMQBi0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10394
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 02 Apr 2025 09:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6696

Hi Christos,

On 4/1/25 9:43 PM, Christos Gavros via lists.yoctoproject.org wrote:
> hi Quentin,
> 
> when you write "compression is enabled", do you mean that the variable "INITRAMFS_FSTYPES" is set to one of the compression formats (by default is set to cpio.gz)?

I mean if the compressed (so not .cpio) size is used or uncompressed 
(.cpio).

You may want max size for the compressed size as this is likely the 
space it's going to take on the storage medium. You probably are more 
interested in the uncompressed size (even for a compressed image!) 
because that's the space it's going to take in RAM at runtime.

If I'm not mistaken, even if the initramfs is compressed on the storage 
medium, the kernel will uncompress it in RAM before using it.

> If so , then i think that "INITRAMFS_MAXSIZE" applies the compressed image.
> 

Reading the introducing commit 155ba626b46bf71acde6c24402fce1682da53b90 
in OE-Core, it seems like this was done for limiting the size in RAM.

Reading the code (meta/classes-recipe/image.bbclass:get_rootfs_size()), 
it's the size of the IMAGE_ROOTFS directory accounting for an overhead 
factor (IMAGE_OVERHEAD_FACTOR) and alignment (IMAGE_ROOTFS_ALIGNMENT). 
IMAGE_OVERHEAD_FACTOR variable is explained in code 
(meta/conf/bitbake.conf) as some free space for "stuff" to happen at 
boot. I am not entirely sure this is necessary for the initramfs (but it 
for sure is for rootfs stored on a storage medium). Then this computed 
size is compared to the value of INITRAMFS_MAXSIZE. So then it means 
this is the uncompressed size we're checking.

What I don't understand is the

"""
# Check the initramfs size against INITRAMFS_MAXSIZE (if set)
if image_fstypes == initramfs_fstypes != ''  and initramfs_maxsize:
"""

check... Why do we care that IMAGE_FSTYPES is equal to INITRAMFS_FSTYPES 
in order to check for the initramfs size? What happens when you have 
setups with an initramfs AND a rootfs on another medium (e.g. typical 
setup for PC distros, or when secureboot is involved (initramfs checking 
the rootfs + switch_root))?

Cheers,
Quentin

