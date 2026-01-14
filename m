Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA07CD37E4E
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:32:15 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12961.1768404729085181880
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 07:32:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RxQ3JxCr;
 spf=pass (domain: cherry.de, ip: 40.107.162.19, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPvK8XXLvEC0n7WYGWZYoP72fnmxZLQL8CYijYl2p/2EP3sF3HwOBRslAB8Pbd1kEDF9X9UbXfC5TOWZqwJtVSl2wePBv0OgT6otdwUiyHd0RDdiwcGUOn42K0eoU48ZBhpAoolMx2ZabB6uN17onNChSOfIWwjTwTp09JiNIP+DjAoI5LLKirUkCo+DtlESU7Pm3cQm+MZCG1hNlsfKqsW3ASlhcDo3TEDEMQLZFhtrGuQP0rTN8gnXZ0moFiLNSVnuEAhI+UqIv5sIn3KLDgKeETDj5o7BvYDAD5qFxaO+dHnItAdbvqV/t0LRYoIjFwuc/fXiLsY5uUQR5PcjDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AObFur2shXgmgIntYRmkAoCFDIBUwxPGsmyDYYWI1QE=;
 b=SdanjEPXKlnmQqLNu0AJkrmVbKDGootgpMVY47S16vwShvreYD7aJ2x8Vz6Im3gHqjJIt9VhX8sCRwxdrHkfLC2p0WUeGOTqbnA0OwEC3JjDdZG46klrdkL/1nAVeticr6Wl+LP4+jCKypYANSGqvNUTffLe8Hmmhjbf9TDZbmn9cTA4fOD9ZWjcZJPTSMhK0YwA8ujWYUGqbDdGeXFs6lMOLIZGaB6WvoLvT1bhNTr9ummLcs8bQBhWRunAWrEUwOYKSgVjooG9ljjFHIW8lwJivx7IST0eWxpGIl94SYEDiZppseWhxX+PQgCsa5ZehUjcEvSi4dNJbAP6b59nsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AObFur2shXgmgIntYRmkAoCFDIBUwxPGsmyDYYWI1QE=;
 b=RxQ3JxCroUaMSZXC92rA53osC06RIUQu4OJjrN33DWsyiRyzr3D7OlJlZrvwVQDbU9ZMSzVDbmp8NrxayogHXVu4eKdoPDG07G3qEBuzOMFuEqYTd0u4htNbWS0mmqRfq94/kUUulYs5l17oT2UByw9xFa4e8Ha4qrp39fbs7dY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by AM9PR04MB8472.eurprd04.prod.outlook.com (2603:10a6:20b:417::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 15:32:04 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 15:32:04 +0000
Message-ID: <229055d3-ed39-47fc-a1ea-595442346653@cherry.de>
Date: Wed, 14 Jan 2026 16:32:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] BB manual: improving the explanation of BB_NUMBER_THREADS?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <73a7be8f-a940-fc40-6a46-77d76cdf582c@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <73a7be8f-a940-fc40-6a46-77d76cdf582c@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::19) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|AM9PR04MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e26eb25-c6ab-4cd3-5c57-08de5382120b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2djdXRIZ3UrRmd0SmxoVWV1SStBcVFWSUdzbDh1a3p1WjVRa2pPazk4Qkds?=
 =?utf-8?B?YWxXSk5kMnR5SFZvcUFrQjN3SzU0SEVuWFF1T1NWSmNpNUxrZ2h1RlorNFJh?=
 =?utf-8?B?NWJnNzNLTDl6ODlyVFdhYUhmN0ZCcW5ud3AxQ1hDRk5oZ2p1eWdRR29GK2FY?=
 =?utf-8?B?dWpmd0tldWxYcXd1LzZyZUQ5SndkeW9RSkdFTmk4TEZjeis4YmRwTkhkVU1Q?=
 =?utf-8?B?ZThHeis5bkxjclJEUzdmZ3J2MDBTWE9yZ2VTNzdoaVRxb21XaWFXSXE3NnFR?=
 =?utf-8?B?RVZQZGRoTWtnOEJYc3RJYXVjMGIxY3RNekd3Ulc1SU5odE9YeE95MzRrcENm?=
 =?utf-8?B?dTBMaVV3OWFNQ0k5WmluQmhoZFN2Z0FNeEd1bm9kOFYvMUZoS0Y4ZTJLa29t?=
 =?utf-8?B?MHhsek84aUNLbVMwUFZSZWFseGh2Vkp6bzd2N3E2U1EwMlBkbktNTWZjL2hi?=
 =?utf-8?B?UXVBVnQ4bXVabURiNTVObERwNVAwM3UwN09HRmlTNlQ5b0JxT3RGTmZuQSt3?=
 =?utf-8?B?aWUyN2pMTENnbW9kWjJrS1FnMDZSWjZxRlh4WFp1UUo0VFZNejQ1aEVBS0pU?=
 =?utf-8?B?dTVYZ1lWQm5XanBmZjU0dFQvRTRKOXdGbUpjRVhROU5IKy8xY0VXT1AwK0kz?=
 =?utf-8?B?UFlOMXg1RDZVQzZEUEpsUWhTK1ZGNUMrTW13TC81VDlOZTFIQzVnTnpWU1FW?=
 =?utf-8?B?YmY1RCtrTmE0Z09OWCtrWlI1eUZweVY4c0gyYXhTSVpCQ0tXSVJMOVBMSTNp?=
 =?utf-8?B?YWlpdFhjM0VyemU4T1Y4aEZlVmxoeWJVa0t3QjJPUU5HWURWM0l2bTE2NE1W?=
 =?utf-8?B?U1h5ci8vdFRUdEZFTDE1RlVzQTRYRVJiYUNDdFZFSnVlMzBDWFhQcm9LdmJP?=
 =?utf-8?B?cnZzYlNjNUkyWUxnU2hYTHQ4MVNiN1JQeUo3SU9JUVA2ZXZLcnE0cXU3bUFG?=
 =?utf-8?B?a3QzUXNQRUdBSmNwM000OWdLVFNidzMxeUhaWHRnQytJblUwaXhCeTRRUmxu?=
 =?utf-8?B?TDVuNGVTb2FtU2JDcVEzaFh6RUZkTHJRVzBaUnJyZVVuWjRoTXpoKzVmMVgx?=
 =?utf-8?B?UVo1OUhqcGhlREZqU1kxWmxlV0xxR3N6aXFsWXNYejNWRkRnRllsRDlMQmRL?=
 =?utf-8?B?NDFpc1d1TmlKbHM4OGRVNGRoZHRPNk9LRDhEUkx1S05LWEFQL0wrL2FuWFU3?=
 =?utf-8?B?UnZYczZGUXVaMTVoc2h3U1ozblEvVmVNc2FUVWYyYU44ZTFGbU5JbEl2cUxt?=
 =?utf-8?B?MzNPSFNqSU1vcWI0N3Y3YmhCWDdDVy9tUkN3OGRiQWdwQkZLWVM5cURXUmN3?=
 =?utf-8?B?QUxrOWtLUlBRejRndHVRV2NjaDR1NkMzOXB6b1hhT3lST0drZzBWdVhLOHB0?=
 =?utf-8?B?dlQ4SEl3WXgvUjlTU0dKK3g1b05lYVpNWnYvcUFiS1hlVVU2R2RMTnVPWFpS?=
 =?utf-8?B?c1NHZm12c0ZKZW8rQXpJd2dzTVJaOG5ZV0liRmpTTWd0dTJMbkg2U3pRQmV1?=
 =?utf-8?B?L1N0aGE5cUtuODVOMDZtb1ErQUs2Wk84VzZOQU9PYzQ4SzNQWWlFdkVtUzBK?=
 =?utf-8?B?VVpEY0UrL3hJMkhISEF2Rko2SXhhSU16K1pvN2luWmpLaENlZFJscVJSMzh5?=
 =?utf-8?B?UzhrRzk3cVlua3ZNRnBVcTd0REVpNTBVZy8vazd5YjNVVTdWdThDcXlLZDRl?=
 =?utf-8?B?c0NKczQ2STU3VmJqNnpIZWFmOTljaXZja0dLS0t6SDBuQmtBNzdVSXBnMjcv?=
 =?utf-8?B?UXorb1lIcGRUTmFibStKd01uVERIZ3lUTmVpSng0MnZaQ0J4cGNCM1FQakN1?=
 =?utf-8?B?LzgxN0FhK28vS3U2UUFvcmRmSWxOdUlKek9VZUNJblB6Q0ttamJKZEVneWtT?=
 =?utf-8?B?ZUVTdEJsazI2WEpoY1BlUkN0aXpPeHZVQ3BzTkZzcTZXZ0IycU9zcVZIM0k2?=
 =?utf-8?B?a3NTRi9QS1BmVUlKSW9ablhiWHQwa2RTaStodkd1WWN6a1Y2V3AvNWtVK2Vx?=
 =?utf-8?B?M3JLWkxkY0pJb0ZXUzd5bjk0QTlrL0dvbDRoTld3SXpXZjJQRjRjVFk3QjJQ?=
 =?utf-8?B?OWw2cE5WeW9OSUJIQ1VHMTkxbUVxbHRNM3lLMWN6NVdDRGJjbEVsZG5kS0JC?=
 =?utf-8?Q?EDn8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXRocTJxRndpQzJidzg5bnpFaEdCWHAwak9uL0VuN2tSeCt5SkcwajA5MVNm?=
 =?utf-8?B?c2kyL0U3aVdSUFdJWmloSzRYd3NTMzlxQTNiWEhlS1pZODdjZWdVMGh2L0hZ?=
 =?utf-8?B?eUZrdmRmQVRIaDBVSWUxaGhUT21MT29hRlkyVm40TXkrYjBwQWE2ckMrT3N2?=
 =?utf-8?B?elBJcTlkVkY4UEdRREtJN1pweHVUblR0NG5kTTJuTllnTi9LSlAvYnczVjNN?=
 =?utf-8?B?U2lqeHBGVkRaTG9aT29OaUp5OTA0NjNicGlTUUhSS3FGVFBmQzNXTWYvaWxX?=
 =?utf-8?B?YVVST0hNb1gvYmVNUUR3WElQL0M0cFo0SjVQV2wvSCs1Rm5vMGJPRzhUOEhK?=
 =?utf-8?B?KzJVeThJWU8xZG5mRjNhUlhtTFJ0UDF0UUM3dXBKRlNTZW1ISE5ZY2psd04r?=
 =?utf-8?B?N1hEdkhtZENqWm5CS3lNT01DN2N5NStZaTVpalNLK1ppZlQ2Ky9ObjhtMGFa?=
 =?utf-8?B?VGRJWGpqeEFMbkFRb1JPSVQ4aEVDQWV3eTlNTUQ2M1hDdzRhL3MrN1VDZjMx?=
 =?utf-8?B?VFRaZ3J5V3EzTStpMUNEektZYzAxTXZwK29CeFM1WkhoUEEyY29PaHNXSzFw?=
 =?utf-8?B?NmF3K2d1aFNBbExnazM3UjcrWDNKcG5XZ2NwdVBzMTArTUpnUHE4ODZFdHBz?=
 =?utf-8?B?dzE3NTVlVGtMSVhpV25PbnRXOVZtM2JHZUlYKzZvdUdXWGtFQkRtbWNvK09m?=
 =?utf-8?B?WTl0cHRudmx6aWJFOEIwdll1bWd3ei92VjRpT2ZGK1NOcC9Gd3FwWGkxM0Y1?=
 =?utf-8?B?S0tqU2x4NGcwNHpPVDg1L2k5Wk5XR2Vtd1QvV3RlcUVENmZFVXBnWGhOQXpX?=
 =?utf-8?B?bVJRdElsdmtLNFIyQ1JHTnNIZmtMMXJjSzJCWTB6cFZsODl2ZWcxeE1xdWtR?=
 =?utf-8?B?OXdIQ3FoYW9vMDAzb3ArNjdWb1VQQ2lNd2FkSU4vdnFkbjdMTDE4ak1Rc01C?=
 =?utf-8?B?UVQrQlRrOXlVcHdnVWFSbWhQTitoWFNWd1RrdGJLeXAvZ1pTYUNIUWVDdTdv?=
 =?utf-8?B?QTZ4NFNidm9xSmdxdWVMRURpenJEeUVMS0RUT1ovL2VBcDFSSDV4VHE0YmRp?=
 =?utf-8?B?L1lZQ3NOaHRldDJ4YUw5ZmlRWjNWVlkxMzVoMnVTaHBUZDZyaU12TkdueUpo?=
 =?utf-8?B?QmpReXB0QkZZa0o3b3REM0FWZlR2cWxtRGVRei9wdDkzclZMNHVlZTdPMEQw?=
 =?utf-8?B?SkcxV0ZMa0s0Rnp5T2RKUnFDbUFzWHNFb3lHbWtmd2JGVDc5K3Nya3RQbjZs?=
 =?utf-8?B?cmpKZWNXZU5tRWpLT2d6Qk5rSng0M0dNTnkrQy9EMlBDdWJvNmdvT1BETkxH?=
 =?utf-8?B?andET0FVUlMveXRRZmdpSnJxMmkwL3dJbnVkQitFMUU2Z05nZ0ZGbU9rL1M4?=
 =?utf-8?B?WVdRRXgybUUyTzFScSs2bjhCUHpwbE1lSU43L3NjUURsVzZYWkszMFlkckla?=
 =?utf-8?B?ckM5UWVnYVdicjR2dVNxY0VydVZnNzNZZFcyOUY0aksvZHYxZlh2OXp0L3U1?=
 =?utf-8?B?eHJwbUxZYWpobSsxSGpCSFVtRVJYaE1Idk9QeTNDNHUzbG9wZnJDQ2daN29Z?=
 =?utf-8?B?VTYwSEprVkpySGpJUmFWSjVwTDZtMThXcnRha2d6OWowMHFjTlpWV2VYRDlp?=
 =?utf-8?B?VnorNkZsRW5GUU91UGg5aktycUpFRGlsd1JLV3BnS2FxbnVSSURFRXlZQlZl?=
 =?utf-8?B?alpIREFBS2tRM2hKNFZhMnhWS1FNMFphdUhMVGdOWmdMOU9nL1g3T0o3bmda?=
 =?utf-8?B?elFhYTZpOVdRQzUwUlNYS2RvNVc3UjhuZURmdFB1MUJPblB2SnlJMk5MZW5O?=
 =?utf-8?B?ZzZRRTZJUVQ3UUdod1F2V3M2TllEeld3MTdlQmUwbUJZczhPYTdjalJqa05X?=
 =?utf-8?B?aDdobEZNRkxNYkEraTQ1YXRWTjQxWlNiS1Z2OEUxcE45MkFqUjZ5RHBFSEw2?=
 =?utf-8?B?dlYxZFpSL20vZW1uN2VjblQ1Q3Z2Ty9kZUpiTFRGclR0a2ZnUXNzcGdqbWZT?=
 =?utf-8?B?MnA0VmJxTjg5RXJnN2VyNE11NURWVHp1cTlnaWpLeStsTGtwNE1VZlFrU29r?=
 =?utf-8?B?OGdKZlRiTHMyVEZ1OUMrQkozN21tSlhCdjM0d2U1VVhvb1cyMXc3TDUvV3Uy?=
 =?utf-8?B?Y1pBQWRVZkk2SW5salE4eUF5U3dqZnVmWTJBZ2NmaXU3a05SZ2NFdHpsUUJu?=
 =?utf-8?B?YzNKcitqaStOSFpBeFN3aS9Gb0R6Q0cyRitUUW9qV0dHZ3g5dmZnZTl3WHhO?=
 =?utf-8?B?QVdYMU95aVM3bndxaHNZOFROUkRicjU0TmRVRnpHaVFSbERtcS9BWHlFNlhx?=
 =?utf-8?B?dUt4NHhrUUhBbHAyb1hOd3lXSjZuSjNKRTlYN2YzRHd3SXBpcWZGQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e26eb25-c6ab-4cd3-5c57-08de5382120b
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 15:32:04.7451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ggXLlnx95aZ1orafud3M/Jjj9DgMU95o5+c3IUg0973pwBIUfsfbKRB5x3SkmeN40fwOVXIfdNS2hbEdLHvUOx3eXrWTY1ccC3sWqezzQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8472
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Jan 2026 15:32:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8556

Hi Robert,

On 1/7/26 3:12 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    (i'm just killing some time this morning reviewing docs.)
> 
> here:
> 
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html
> 
> i think the explanation of BB_NUMBER_THREADS could use a couple
> improvements.
> 
>    first, the way it's explained, a new reader might think that they
> must run off and set that variable to get that parallelism, when we
> all know that OE's bitbake.conf file already handles that for them:
> 
>    BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
> 
> so a more useful explanation might be that the reader might want to
> set that *if* it's not already being done for them somewhere.
> 

Like any other variable I guess? Just check the value of the variable 
with bitbake-getvar to know if you really need to change it?

This is the BitBake docs, the fact that OE-Core or YP set a default 
value doesn't matter to BitBake. We have some users of BitBake outside 
of OE-Core from a few discussions I vaguely recall on IRC.

>    more importantly, from experience, i think it's useful to suggest
> that the developer might want to *reduce* parallelism to prevent a
> build from overwhelming their build system. that is, sometimes, maxing
> out your parallelism is exactly what you *don't* want to do.
> 

This is valuable information though and we should mention this indeed. 
Would you mind sending a patch?

Though I'm wondering if it still is an important trick or if the various 
BB_PRESSURE_ variables aren't enough now to be able to not have to set 
this variable to something else than cpu_count()? Note that cpu_count() 
defaults to a max of 64 cores, but that predates the BB_PRESSURE_ stuff 
if I remember correctly.

We do have some explanation in yp-docs 
documentation/dev-manual/limiting-resources.rst but I'm wondering if we 
shouldn't have that (rather?) in bb-docs?

Cheers,
Quentin


