Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDB2C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 10:30:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.64])
 by mx.groups.io with SMTP id smtpd.web10.46512.1748860214907732733
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 03:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=eXbic9my;
 spf=pass (domain: cherry.de, ip: 52.101.69.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9ZpFtmxu61c4ng9A45jUeMa8XmCUMsLlnkfiQBAhUX8adnRpTfIQX8qGhWd+UHZBBs+201XkoQ85kSS2gb8nfgEIeBop/qAtMujSCVO+LiXeCGBoCh/j/H29ncd5EcYjoJMNJ73zBwHEK8K2dKNkrS7g78A7uM1DEsff48oeyxkSgcQdi6wbf4LrKgzv4Uu/ZalPHei0iD1FQCGtI+SWt8D9v2Ox8fUlic2Ia6rtY49jjKiD2EHTNLd6ozh9Oq/aEuejQjvMNrHCWlyfpBk7HCfLDfT4kFhntXlbSeqlS1kCrDYCOgTI6kZHzsmgS56rmKpsvhoAlBGLwPYl5wzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AMZ2Yf3nPJ9M4H8A0TQ1n886YhhBKbQz/0OTvW+NuA=;
 b=mFGu1Uqxbgs1oxdvxcShCzWNgS8noefH9Yod+SLzAGC5AK3kXoGpW9dKUp4bphLugWiHC3KmLQTusQfEzLjZwH0EJYzLcrArcilSj0ZBtwdhDT90EPeqj/mydedbDwCMEB1Vj8gkCV5+VnHQgFdYf8SJodbRX06CNCuZPd/ct49LjQ98Za6Vjm/TgDdkcGDn9z7FVAYILofomgupYKFstolI5HGgLkos8vUxl2XjVUeW/FrK0DaUyqSCTV8RMvXwjNiYhqU+35B3w/zXgqvXcLsFarxIH8jCTFkNHzm2MpGQzE8LwMXMVz73ZuUzhZTFSVDsotyxtYmevtoMTZMybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AMZ2Yf3nPJ9M4H8A0TQ1n886YhhBKbQz/0OTvW+NuA=;
 b=eXbic9my05dNq6w3mhOdEug2gHrIlD8VLYlk7pqJtxrNJCnA5FG4oQyNEU33CjUc9sKsDYNCY/Nu3ErcxjikXD3qQGOJjCnQanmLEW+ePRK/hK6VyYQ1LGzqLAvM/x0gGzuFvz1E1ZERMz87I7Hi/f043QFgAB68A1PwqfiiQ58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB7537.eurprd04.prod.outlook.com (2603:10a6:20b:282::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 10:30:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 10:30:11 +0000
Message-ID: <0de35f6f-ba02-4fc9-ac82-7534b93c0eaf@cherry.de>
Date: Mon, 2 Jun 2025 12:30:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][walnascar] brief-yoctoprojectqs/ref-manual:
 Switch to new CDN
To: steve@sakoman.com, docs@lists.yoctoproject.org
References: <cover.1748627115.git.steve@sakoman.com>
 <152466764d89ba25a1e259d917a16c69438c6f9a.1748627115.git.steve@sakoman.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <152466764d89ba25a1e259d917a16c69438c6f9a.1748627115.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0346.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::29) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 42874b13-67e3-4ef0-070d-08dda1c0742c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aVRBR3U2Z3JEYXltOGgrdHU3Y040bDc5TnlnTjRmYmtDN3VHeHV0S3oyczdy?=
 =?utf-8?B?SzlSOGJZWTVmRm5sOHJZSExvNjFOT1NVOFpnaWVjamVIVlE5Z2ZZdmZPdlhw?=
 =?utf-8?B?NjJLSGxpdEdyNkZ2T0FDQ3k1MDBlT2VYaXpvamtzTkh5SEFxSkthOFkwQVZS?=
 =?utf-8?B?ZVB6bU1McnpaakRCZE1KTHowTE9OK29jYXNGZmZiRFJJZDQrUllFbHJIYnNx?=
 =?utf-8?B?bVNzYUkreS9zRXZIK0xKc1lJKzF5RHhIeHZVRS8wNThvcnB2aEwvd2NkeWsw?=
 =?utf-8?B?MFljZmZWRXBIZnJTbzkzZzRaSjViN1F6cHlMbjJ0WTRXNnBFZUdPTmp0Rk5L?=
 =?utf-8?B?QUVFZW1NdCtjbzJ0MGhONUJtRkl4T2J6OFB0eEMwRTQwTFJOQWdRRHFNK3h0?=
 =?utf-8?B?RDh4TThVd2dSRWVyNjh5djJvUWRUeklzN2t0MHFiMDR6aWxCbDV2VEF1d3Fi?=
 =?utf-8?B?RlZuT1FHNzE3R1hSdy81Uk8zQkI0Mit3cnYwZStQOHhidFNGV1o3N1pMUm8y?=
 =?utf-8?B?cmZEM3dnajJFMzZ5bCsvNXpGdHlOV0c4ajIySFBvcTNxcGdPTVFncnV0cStG?=
 =?utf-8?B?c1hUZy9QUzNFTWdGbmFvZkt6ajN2NTdwS2RoMXNnNzR1UHFBcWFYRGRBOVRH?=
 =?utf-8?B?dnZPVVpZLzRqelptK3V3dEJyVkN0NGdqSGNtUlhTTExlK2ZqVUZ2T3RvTHIv?=
 =?utf-8?B?RzlLRWt2cXpyZW9nWCtnTjlsUDJWbkZaK0pGSXFSbHhSaGw2bisrSVdwWTly?=
 =?utf-8?B?czdVVGFkNENqcXRacFFKWFhDRHM0S2tCc2JLYUl5UHErWlBBM2JhVzN6Y1Zr?=
 =?utf-8?B?azhxS1h2LzlqeFFINlJXcUYxSncvSTNQL3ZES1FwUHhwenBXZlB2Y1RvUkdS?=
 =?utf-8?B?YldzdS8vYWR3SndXbHkwMjdtMS8rTzVuSGdmZklabzlqUHdLQWIxQWplODl5?=
 =?utf-8?B?RHNCNDhzVUVOY3RpaFlrVXFQKzFsOHN5bzFhejNBSHlkbGN0K3BSNGpLcjVJ?=
 =?utf-8?B?VEUrYW5RQ0RSQVFWSnJubFJEOXBsbEpHSlVmUHJySEFJMThLSDFhbWpwVkIz?=
 =?utf-8?B?ZEplZmg5UTd0dVR3RnhyUGJzdjB3ZThWNDlXS1huL1lLS0VVY05KMzJSWm1h?=
 =?utf-8?B?RHBmdGNjRGhuSDArbS9QaDFaa0hTbVVub3MwSFRERkFvUVZLdTdSb0dJa0Z2?=
 =?utf-8?B?c3Y4K2hPZ0VLS3hUMkdROE8rVFFiWS9BZFR0aTJqSHJBZG5MelpXVTEwSlNa?=
 =?utf-8?B?aDBNQ2RScnBUN2YzSzJtSTNiN09mbG9PeXJ5WnI3NzJzYXhvd2ZXM2NGSXFG?=
 =?utf-8?B?bWdaTkVLMjNuZFRDNVRzYllxVmMzSktocTdoQ203NlFKc29sbnZsZzhlRFQz?=
 =?utf-8?B?RGlrakpDT25CM1Z3clMvNXZ6ZzZCVzBTR3lCWW8wMmNSeU4vRmpkai9lTDBp?=
 =?utf-8?B?eVA1SVg0bFZSMGRCUkpxT04vL3dEMHNlUEFTZEJmTzVDaVpuKzRXTUhORkNh?=
 =?utf-8?B?NWFjV1UvWTNHeWRjODU0VWtxR25kbkVBSTFxcFBoMlZFMjNock9kT2xuazdw?=
 =?utf-8?B?RnhOZXJBeWJIWHY0NGFYeTJ2VjVPMWZ3ZUJxanYrNVp2K2FLT0RTek95c1Jt?=
 =?utf-8?B?OHduWnQrTWJHb1VrbHdtY2J4VnM2MEVkVDdkN0JxYVhRWkhIeER0YmFDd2pt?=
 =?utf-8?B?RFlNSWpWTGZGUUxVdWZnbEZidjlvOVIwbmdoOU9VbUNHVzduRmVYZHYrT2hB?=
 =?utf-8?B?dzFTaWxjRXEwOUhDYllsVXFKVmZIRzBjWlVTNWZoeUUyeGFqY3V4aTRjdmx5?=
 =?utf-8?B?bEd1OWVzSzczN3FOT0s0bFRneGhCbHN6UzlLdlY5emR3SEt4aWhlZFdqdHBj?=
 =?utf-8?B?dng5elErcU1TVFVnOGFrbHk2YXpEQnVUb1hWczNSSmRqaitYRnFrZkVTdG94?=
 =?utf-8?Q?h8Lzk5JxIU8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlUxSHNaejI3ZHhLRTE2RnJrWGpjSXJFZnlYUWM4RE5ZTENVVzNwZ284Ykds?=
 =?utf-8?B?NE9BMjhjcDdoaWxsQjI5eXQ3YUp1TjNEdk5Ea01PdUk1bEg1SFg1RHZ5YmRa?=
 =?utf-8?B?MmttMTUzYXpDa2pZYmJIVHRZQlZuZUl2eU5yN05EcFlmQUJma2pPQ0NaWitQ?=
 =?utf-8?B?d3Vtam1ZSHVWWllXYXhEK1ZYMmd5RURtZ1V1ZzJOejdOKzNFbDJ4eHAveko3?=
 =?utf-8?B?WEk3eTFaZWEya0FIb2FndVJxZnl2cjJyVWVJYXlhYjNtQ1lxQVNxYnRMRTRJ?=
 =?utf-8?B?bDRDK0M3TjlQb25zWWZmdThhSWhuRUpzOXVJaVYrUk8xSkZsdlh6eHJwbHVh?=
 =?utf-8?B?c295NVFpK1RQUlpENUt4NERyRXE3QTUvdk10c0M3L0dLR2M0M3NGaTNSaWJk?=
 =?utf-8?B?cHJLV2dnblFKZno2VWpGeEJ5cWU0aGJCQStJOGM3b0VkaHVsWHBwM0dEZjJQ?=
 =?utf-8?B?Z3BEL0prSG1pazhyRjdhOHdmenFmQzRVa21TbDM5NUtyTmFySWFJVk9LRTlx?=
 =?utf-8?B?dFNVVHUzTGo3WjgrdldRTzFwbVdCZFFidlFPQ1g1RFJ6cGlEOFNkQXg5N2xO?=
 =?utf-8?B?UnMwVlE2Uk1MWU5CckFJVkRlT0J1VEo5aXBwcW1FcGtaZC8vN3U3em1yeTU5?=
 =?utf-8?B?NHAzZFRoQjBDQVcyOVNvTXlBeExGVHA3QjA1MnUzYTBIVG5KNWluaklEcjBH?=
 =?utf-8?B?eXV3NG1ManRDRlJOMEZaQnRXSlE1WWFZQ0dMK04zclM2TnBCbU9RVVVQVDRI?=
 =?utf-8?B?OTRzRFYrVm9ZbC91L2phRUdFRTNla28vWDQ3TzNFR1g3VmFpeTVCelJ2Y3JJ?=
 =?utf-8?B?a2QvK0loTjBwV3MwdlZYR1QxZTE1dzN3WjdQZnpDOU44aGJpYk95KzRVNkRk?=
 =?utf-8?B?UGs2dnhSc3U2V1dlWHpvUkJuMUdGWHVjZitHSFJLa3crRWNvVVlNTzc4U0kr?=
 =?utf-8?B?U3cvRk80V2ZJTDl5Z09WZXBpby9uMUVOR3hlWGd2SmhHWWVVS1JqNnFiRFJW?=
 =?utf-8?B?T2hyRXo2cGp3Mi81U2NmS2U5RDZaUm1LMHZVZjRmeGVTMjZJa2NXYkhRS1FZ?=
 =?utf-8?B?UDFaeG5ISHEvOUUrSGgrYjByQ1RMSzZFWnFHR1ZodWd6S2Fxb3haNERyZkxu?=
 =?utf-8?B?KzhMTjRvbHEvSTVnRWpBR0pHYXhmUnBWcGhnaVQ4V1JRTE0vbUtMT1hFcXRW?=
 =?utf-8?B?K2xERms2ODNZUWljbjJGSjNrTE41YWdxb0FERW8ydHBGMkNkeUtrSVpzYnlt?=
 =?utf-8?B?QVplVlphWGEyQmZHK3VzblVZZWtvNG54bGFZY2xXeXAxMkhOMXZRV3VsL3Iy?=
 =?utf-8?B?aFlCOFlzbzhqY05xdjM4cWhHUmw1cU9wSC8zeUtCejYvL1Vwa3JhQ3grRThx?=
 =?utf-8?B?VElzYnVsTE9mZklSSTU0eXJYQ2h5cGxSNWtadE0zbWV5eTVGMTM2ZnE2TThx?=
 =?utf-8?B?ajhFTHNkWFF3N25kWjJHaDQzenQ1SjBkcGVMNE5sSWY3NzdSRGU5bzJmaW9G?=
 =?utf-8?B?RSt2eGdqV2VDN0dBbmpiTzJteEZ5QWNxdnVMWkx5SU9qTldLRWZvLzNXYWhI?=
 =?utf-8?B?TjduN1FJU1JhYm1NbzFzZDRjK3Z3Qi9ENXZzcEwxTHBYWWV2N3JzclFRMDBq?=
 =?utf-8?B?Y2gzeWhCalJEcTM0bS9GMVVkUWxybi80SU1aeTZ3dmpiZUpPdG9WbWZOa3JB?=
 =?utf-8?B?UmVyS2E0MnVnaEN5WHpwSnhYeWdIRVZ1NjVDcHhyay92TXlSRE1UQjRrM2lt?=
 =?utf-8?B?UnVQTHl4VWVPcElCT2dHc3pmWXBSeEhRODNSMlRUSFJjeXJKcmV4anhjNXR0?=
 =?utf-8?B?TE54YlRJbGNMYkp3Y245Rk5zREFYT3pJeG1pTmNIQjk1QXRNL2g2OVNSMzNR?=
 =?utf-8?B?Tk5XbFZEbURrVnpjNkpyK3lidDR3MlJQMTFJK0dQRE9ZNFd6Y0tibGhBbndn?=
 =?utf-8?B?aFlUdW9RQnlrUTJ6SFViaXZ5TWNOanhBdkV6TmYwVnhGY3B0R0pJTjFCL1Rk?=
 =?utf-8?B?SmN5Qk8vS1JoQ25TTm9uZFpRY2JrWlhWbERoOTUyQXZoV2hRMTBnUGpzUHY1?=
 =?utf-8?B?N0hoUkl5Ulc2WWxaeDM2REdPS1lmRmh4M1hoRkRHWEI0ZjVCOTI4VWx2QldP?=
 =?utf-8?B?cHV3ZFNROWJ2L2lueC96UFBrL2tJOTZoVjlaUEYvU2ZvNDBCVTc4VUtwUi9M?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 42874b13-67e3-4ef0-070d-08dda1c0742c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 10:30:11.4011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMuMFWJFLvktmGcjutmgaCtlfXg48Skd6lDjF57DX8mzWHdTwFQmKYQt2HweVY6WJwzvzbBTNw9d1BrfbtBos++6lKdHKLjbwEKljOI/mdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7537
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 10:30:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6964

Hi Steve,

On 5/30/25 7:46 PM, Steve Sakoman via lists.yoctoproject.org wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> The project is switching the way handle our CDN provision of sstate objects,
> update the URL accordingly.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 406e8a8e30404c0538f5aa46f211540bae2b206b)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>

Sounds good to me. Richard just said[1] that we need to backport this. I 
would recommend to backport even to now outdated releases just to avoid 
getting questions for things we can easily patch (but that is 
your/Antonin's decision to make, it is outdated after all :) ). 
@Antonin, @Steve, anyone of you willing to do the backports?

[1] 
https://lore.kernel.org/yocto-docs/24b874c1e05cd7e4582f803957a807f45a9284e7.camel@linuxfoundation.org/

Cheers,
Quentin

