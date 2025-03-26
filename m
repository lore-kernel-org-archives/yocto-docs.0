Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC72C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 09:50:18 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.46])
 by mx.groups.io with SMTP id smtpd.web11.18364.1742982607568803621
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 02:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=d0jzbhfo;
 spf=pass (domain: cherry.de, ip: 40.107.247.46, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiPOA6q1EtvFJhL2A9c2gHDrAjCNy4QF1Nazqr6WRyNFGQhmrJP6rDrrEdsjMP5LyWnBOHapk+k1rr1QOnIZtcPKjWEzlKYQ3yy8pkxNRPsy3+Faqnsxo6yc/zVmCPDBfT+QpJ3sXWmsOpHOk1N3OV4IY1AaTjrL7MixXQOABFEt9IpB9+ihNx22TMwx8PM5/E7UPrbLKmlq3Od/O1gRHVnxHgOE4ucBNb4GOzXa4hccKom7kQMI5ByXLbNbo6g/4lmrLfbpO+0j5ddU7iideFc5e1DJqi/cuHWxRg8q040J84HTwOeeEEXSoLYQy3w/z7IGGHuN4MMlC4YIrGl/JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0v/T3YMv+6RFgEhgW4O04V48j1JlfmIkXmzlYxV4CEY=;
 b=AeQu3c+UZUuEI+ELrtSSCVBJag/EPxkgvycIR275T7xna+LHnXUAhvRRjZwgj6PmceGFwsW2ZpvaHBB0SLmN5TqRMVwNpr5ve3YsgypyKnIB4ZtCC755HLH5kFxPmBIvVU+rwgZO4cIIrtKw50XDBNgoIzzfa9hj7g6rAbNlhmjnI5FS2FTFRh9CMq+P+/JRrFhilymtj7ZAElXMYb4PItp2QZTA6ve1L2PYqh1iyp1NoTvK+OITNcyJtOgWKoGX6c5SLnMpysRfpG5867bTi8HMuAQQbyayzAcI5HSGtRM4gunzBX44+L8hYGjKOm30heD7eE9javoiebH4sLt0yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0v/T3YMv+6RFgEhgW4O04V48j1JlfmIkXmzlYxV4CEY=;
 b=d0jzbhfoXDjhX9lrtZiETVXJQgOb6MwCMQTOfXq4eH71XTXqRa08Jzpqiv6xuGUSp1CumzVhzej6nELaDK8xF/5+kPVCmFvQA9EmFhyOaTH+VQsf7SkpizwxEnfe/k7kniEKlTWrcmMLdQfj3VNJOHfDqrelPzIiXx9gCiQ952o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB11100.eurprd04.prod.outlook.com (2603:10a6:800:298::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 09:50:00 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 09:49:59 +0000
Message-ID: <49b57527-5458-45ba-9e3c-524b435e20f5@cherry.de>
Date: Wed, 26 Mar 2025 10:49:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH 1/4] ref-manual/variables.rst: add missing
 documentation for BUILD_* variables
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250317-cc-vars-v1-0-25edbadfd054@bootlin.com>
 <20250317-cc-vars-v1-1-25edbadfd054@bootlin.com>
 <29a6499d-22ca-44e2-bbda-2148ca6ba8b4@cherry.de>
 <D8Q32WJD5YSK.2036RNP79DLND@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D8Q32WJD5YSK.2036RNP79DLND@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB11100:EE_
X-MS-Office365-Filtering-Correlation-Id: 88eb63fa-8de9-4dac-24d1-08dd6c4b92ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nk53V3BwRGRIRGJSS0xTTFF1QkVuSUo4R3VkUGZUZlk1azF0dm1pUFFENi9P?=
 =?utf-8?B?aG9EWnh0cE1ZR0EwbE1mRkpXbFk5SkZCR2ZEdDZGK1cxdXI5UUpna1psVlpt?=
 =?utf-8?B?UXdjcllncW12VVZyUjZKRDE2eFBzRjU4SWpBWUpCUEJORHU0NlRhd2NERkR0?=
 =?utf-8?B?d1NZdzcyOTJBWmM4NlkyU1hxZnBNWkpOWFI5Rys0ZS9FQzZkOENrcEdOd0RS?=
 =?utf-8?B?NFZrOUl2dWlXRis3R2szNEhWUU93dllEcGRTTzQ2dU1pRklOWnFCSDlLL1Q3?=
 =?utf-8?B?QjNzSVZzb2M5bHdjUmJZcnBJcFd1VDdic2dRdmNUMCtZM0xOak96VjZuT2Vt?=
 =?utf-8?B?dzUra0JwaE5GWGNPbG9ORGlseDc3SEVMMDFUUEl3TzFoQk0zQTRsRkZqS3ly?=
 =?utf-8?B?VGpRYWx2VWk0QjZnWjlaYUhOa0dSbFJROHZjYVdWeWZIbWhCTDJwYnpWMlRF?=
 =?utf-8?B?ZXJSU05xSXVVRExyRzhrbTJhbGZmZ0NmUnRnZVNYSEpUZXJQQzlNSVZTRis3?=
 =?utf-8?B?LzBNNWZzUVpNR3RyYzZlUXNMdHBUaGVEaGlaR0NLUzZjU0llcGFTVUw1UzQw?=
 =?utf-8?B?UXpVQ1dHVy9IOTAvYjhsYWtDdVB1VUZ4T29tcEt6WVJST3FPcFpnU2J4WnMz?=
 =?utf-8?B?STlZbStYeWdiQk9HWmNmalcwNGR5QWV3S0poNGwrc2xtNmdOMWl2cmlOQ29r?=
 =?utf-8?B?QVhRdGhYdmpJT1JpUU9RanpTWEFUZWMxNnZqZWJkQml6VGc4KzZhUjR0aitC?=
 =?utf-8?B?VWtVSnVxQnpzS0FReW1ramRXOGdJRzExKzkrK0V5Zkh3K1hMalNHUUtHdzcw?=
 =?utf-8?B?MSsxRjAxT1BVV09pZ2dvY2lwQUdjSkNRVlEvbnhOSE5ONWl6Nmxlc0JpbUZz?=
 =?utf-8?B?cEZuOXh5aTIxQ2VNVWFsNmdrU255cGx4TVNnQWhvQldQSVZVYXRSRm5laWRt?=
 =?utf-8?B?SURVbmJMZnJiTXdNVUpCZHFINW9MVUxJckZhUG1oc2RJOHBDNmRYcTZoV095?=
 =?utf-8?B?VEhSQ2dVNkV3ZEZLSDdjc3AyRUlOVFRabTRUSHY5dEcyRCtsbnVuaE9QTTAr?=
 =?utf-8?B?Z2VpWWN5WkpvRy9malZjWE1GaUNNbnhscWkvK0djR1J2dWpXV1paMTVkT1F2?=
 =?utf-8?B?eVB3NmxPMS94WUtSSHVPOXhYdXRYY1NQNjB6eWhVSlp2RWUzaml0VHJoTGl2?=
 =?utf-8?B?eWV2ZnZuc1AyYUVJMy9pTWhGZVZnbUlGc0Y3NnFHYStxT2t0REduV0RvMnlL?=
 =?utf-8?B?dVFtTG9pQUFENkw3WnRIbnc0SDJ2ZlNscUE2eFh6M0NLODU0M1lwUVBJWEhU?=
 =?utf-8?B?TDl0bkxhQ0tOSmViY2hTK2YvRUl4K3d0TmpycEVhTWxFeWpkbGZlYTRJOC9L?=
 =?utf-8?B?TFJYUTJPSUp6bWRuRXRxdGZ1ZFBWQ1NTV0YrbGpKZ0lUWERyUW56MmI3OHB6?=
 =?utf-8?B?SkhOcFRPSFZiV3ZFVmtQb2ZpQkpIeG9POTk4NU1hZGQ4Z1RjK21qc0hZSk1X?=
 =?utf-8?B?TnUrQkNpbGRvZnUrYWpjVXBBQXBZenZxMjNnTVdFY0NocFBCdGl5SDU3eG1Z?=
 =?utf-8?B?MERveG9kZGlGc1dzeFgrKzFldlI4MFg4eWJyeXBtTWZyVk9halowT01MdjRt?=
 =?utf-8?B?ZGpwVU5rMzgwd2laaCtBNEVVaFNnU3ZsUWt1aFBRMEFrUzR2Y3MyQjAxNnht?=
 =?utf-8?B?L2ZrcDExelRkeEZPQVRNRm5BSXJMalhwUEwxTW5zTElYTmFHc2R3TjZJY29p?=
 =?utf-8?B?eWpXSW9VT1gwSDdYVTlaeTdhSFliR2NYemp6aWtmYzdGMlZtTjVqMTAyUXdq?=
 =?utf-8?B?V0ZocHB4MEovZVlYUFJISmRza0ZpdGRMbEwzWlZVWXQ0QjdVb1JUTm1LUEtu?=
 =?utf-8?Q?HqWuqYVBpkQxF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTNHSE91ZUlzSVVxcXV0WkgxRnUvNGcxUFR5T1Q5WWk4RzFndVI4eGwxamds?=
 =?utf-8?B?R3N3NU5Jbkt5UWJDZ2F1MDN4UFUrWmZPdzA3dlhPOWM4d0F6OEpmQlB3dVh4?=
 =?utf-8?B?MXF6R0ppKys0YVoyKzNZdFpnQ3VWSUI4QlBaVk1iWVo3UXRJaVNuRjFrdW5D?=
 =?utf-8?B?dnZCK21zU2VrWC9kaWFJNnVpc09yQTlYaTVsUFJwS1lCYldLNEJLZWFJVlZj?=
 =?utf-8?B?N2pJVWpURlJHVVJ3RHoxNnNaVFIxTWxkNVM3djNZemlVby8rTkN4UE5DTm1H?=
 =?utf-8?B?d092LzQ1VW53anZ5TStZeXJ4N08yMnhiVjRSb3JGOUdXK1VtWWVuVnlxT0Ny?=
 =?utf-8?B?RStkdjIxcXpDZTJQUEdhWEo0WXlaSEFUb2oyNnB5RmRGbG5kUlNPSERkdlhS?=
 =?utf-8?B?NGs2anROa3dGUlNPUHZBeXZTQ0ZaWjlRSEgxNGtMSTdIaklZR1FSY3htTUVj?=
 =?utf-8?B?NjhoUkZiTDR1d0JJOXV2NnpCTW54Y01JcTdTREVCZUJhY0JtS0pyN3Y4R1Bj?=
 =?utf-8?B?YnVwU3hpVVJwSzY3SFk0VEk1a1RKU21sdkhrT2dha0FoVzVBL3hIRTlMS0xJ?=
 =?utf-8?B?RThidUQ2eUxnNW1wWCtzakF2OEpycUpPT0RESktNNnppSTNOME9ZU3Vyb2tJ?=
 =?utf-8?B?cVM0SFNwa3FnRDFjUk5MUm55MTdjUVdVNk9CajRCR25LUmlva1dVQkxuMnlN?=
 =?utf-8?B?OTJHeVg4TiszWC9NSUpSQnp0bVcvODBzTHEwdHMrTVE2RFRRM3U5MmZicm14?=
 =?utf-8?B?dnp2R3NqSytMR3NGUndJaFZFYWRmcUlPemtuTFVZVlJ4aGc1VHFSNjlVZ3JC?=
 =?utf-8?B?MSsxQ3A3Y0xnVU8yQ2tyMExBNGxwQjg3U1U2TjZadDZGY3pXVUgwMFloei80?=
 =?utf-8?B?VGFDbllqUDl5amE4aTB5YW1md1Y5Y0M3WWNxM3NtelR1VGJYK05WeHQ4ZmNZ?=
 =?utf-8?B?WUVCeVN2YThOM21HM0RFd25MQkpOWDhWNFpHNkhXOGx4aVpiVzVTRXJHUG5Z?=
 =?utf-8?B?ZnZ1Z1NnOVcyeFByWVJjZHBmR1FWUVBRMlpLeDAwRTFCS3h3SWpYN045cHBt?=
 =?utf-8?B?T2JNZzlpVlNmMGZNRlBKdXg1dFJobWtTUXdOYUJRR0Znb2V5OUVGRWpDNTlX?=
 =?utf-8?B?NlBVM1RJbjhzRFNMRStYSlhTcVpRRUhMb1hLMzZjSXhTbEJRU1Q5ZFNsNFJP?=
 =?utf-8?B?dHdHYVlvODRFV3dIWUJqRVNoeHNrSWtqU1JCN3RlU2trRFdHZzNGbUJ6TXdm?=
 =?utf-8?B?a1hBYUxwOVIwVXQwSGluWHZQUWc5azFOYzJEbHNiUzJFOHJyNFpKQjNudEtz?=
 =?utf-8?B?SkwvRDh2MTh0OWt0VEE5c0IzdUFuRnVhVHI0T01CMkg4bkRMTGRabFJTMThH?=
 =?utf-8?B?bGtlWituTmtVdVhVcG9FRnBhZzA5dnZTUDZXUXlIMzZPNFY1Z1MwMnhSZ3pR?=
 =?utf-8?B?ZGp1bkFUN1BuOWY4V3hnMHMzSzg1NVVqYklmaHZUU3I3eVNQRCtpVG9DaGlE?=
 =?utf-8?B?eW5uRFNkYThkRnhTaXVOeWpaQXBLYnlnRkt1NUM4VlBlNE5hZUo4ZTdRMkQy?=
 =?utf-8?B?bGkzYkZqS2M3Z0kvRHdTK0IwK1NIRmxWdkRKckhmMTkrYzE4MDJVSWVxb09s?=
 =?utf-8?B?M21VZ3ZwZTh2dktYMFcxVWFGVGlSaFgxZERlaEtJTXcvUGdXalU2bjZWNlBJ?=
 =?utf-8?B?VXVqenZmNDlMQ0RUMDhUem4zWmI3YTdweFV3YWltQUxRU0VVMVpNU2tvSVZC?=
 =?utf-8?B?VW1MYWc3QmtoWXFuRklaZFVuSnJrQ1ZiTGpHRTgvQXdvUFowd0FPTndsRi9x?=
 =?utf-8?B?L3JNWlRNVjJXVnFpZVg3RDh6dEJTUEhwTTZhM0hEYXN5VjlrY2VvK1FxTU4r?=
 =?utf-8?B?L2w4cGhPeXRSMXRWblJudFZ6bm9pLzJXV2FWMXV0cFI1K1pmQmlLRTdrSTVn?=
 =?utf-8?B?UnRBQUtRSFZZdkhqSGZDbGpPdHA5djFoMjVoakYyNGwxRTA3Z0tkcks3dUds?=
 =?utf-8?B?U0MzSmhVK3BYUzRQeDBrMS92ZWRnYkJLS3ZEK3ZHWmJ5dmpxZ1N2Zk9YWXNJ?=
 =?utf-8?B?dnFCamhqYTZ4M0tVdGRtQU45SzM0RGtwek83alk4RVZuaGlMekJLQ2VCUkps?=
 =?utf-8?B?T01yRTd0SGFmbjNFN2hiL3g1YlZtK2tLUE1udXZSdXRCTG9kNDRIemxuUXdu?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 88eb63fa-8de9-4dac-24d1-08dd6c4b92ae
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 09:49:59.7232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4YEJCWzmfZxSMHgJDniLWv3A8ykJnnYptFAxTMuzzb2NAWhU82bZn+J3sH4whSq4PAB6+Mm0N8Quyx05XYw9sWn0Y+IJpJnlLk+AAWWfpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11100
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Mar 2025 09:50:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6631

Hi Antonin,

On 3/26/25 10:17 AM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Fri Mar 21, 2025 at 5:22 PM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 3/17/25 5:03 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> These toolchain variables are used in a native context. Some of the
>>> BUILD_* variables missed documentation. Also, some of the base commands
>>> were also not there so document them (FC and READELF).
>>>
>>> Some of existing BUILD_* variable documentation were missing the note
>>> about their usage in a native context, so add it too so that all BUILD_*
>>> variables are documented the same way.
>>>
>>> [YOCTO #15719]
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/ref-manual/variables.rst | 107 +++++++++++++++++++++++++
>>>    1 file changed, 107 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>>> index 861b04eaa..24b3f7db9 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -985,6 +985,24 @@ system and gives an overview of their function and contents.
>>>          variable is a useful pointer in case a bug in the software being
>>>          built needs to be manually reported.
>>>    
>>> +   :term:`BUILD_AR`
>>> +      Specifies the architecture-specific archiver for the build host,
>>> +      derived in part from :term:`BUILD_PREFIX`::
>>> +
>>> +         BUILD_AR = "${BUILD_PREFIX}ar"
>>> +
>>> +      When building in the ``-native`` context, :term:`AR` is set to the value
>>> +      of this variable by default.
>>> +
>>
>> It's not entirely clear to me from the text, but I believe we should
>> only be consumer of this variable? Or the toolchain recipe/bbclass needs
>> to set it accordingly, but otherwise nobody should *modify* it, right?
> 
> Actually, users shouldn't even use this variable directly but only AR (see
> the explanation below).
> 

Then we should make this very clear in the documentation for the 
variable. Essentially "treat this as a read-only variable except if 
you're adding support for a new toolchain" or something like this.

>> I don't know what an archiver is, would there be a link we could provide
>> to give hints to people maybe?
>>
>> Can suggest:
>>
>> """
>> When building a native recipe, :term:`AR` ...
>> """
>>
>> I would love to add a link to what a native recipe is but my grep-fu
>> failed me today and couldn't find anything satisfying, do you have a
>> suggestion maybe?
> 
> :ref:`ref-classes-native`?
> 

Works for me!

>>
>> A user question: Should we use BUILD_AR directly? or always AR?
> 
> Always AR, to my understanding. The native class takes care of setting AR to the
> value of BUILD_AR. In your recipe, you can use the AR variable to do your
> things, and its value will change on whether you're building the native recipe
> or not.
> 
> You would only redefine BUILD_* variables if you were to add
> a new toolchain, basically. See toolchain/build-gcc.inc in OE-Core, for an
> example.
> 

I think we should make this very clear. Essentially:

"""
This is only relevant when adding support for a new toolchain. Users are 
strongly encouraged to use :term:`AR` when wanting to use the archiver 
in recipes.
"""

or something along those lines?

(same remark for all other BUILD_ variables).

>>> +      Specifies the architecture-specific assembler for the build host,
>>> +      derived in part from from :term:`BUILD_PREFIX`::
>>> +
>>> +         BUILD_AS = "${BUILD_PREFIX}ar"
>>> +
>>> +      When building in the ``-native`` context, :term:`AS` is set to the value
>>> +      of this variable by default.
>>> +
>>>       :term:`BUILD_ARCH`
>>>          Specifies the architecture of the build host (e.g. ``i686``). The
>>>          OpenEmbedded build system sets the value of :term:`BUILD_ARCH` from the
>>> @@ -994,6 +1012,15 @@ system and gives an overview of their function and contents.
>>>          Specifies the architecture-specific assembler flags for the build
>>>          host. By default, the value of :term:`BUILD_AS_ARCH` is empty.
>>>    
>>> +   :term:`BUILD_CC`
>>> +      Specifies the architecture-specific C compiler for the build host,
>>> +      derived in part from :term:`BUILD_PREFIX` and :term:`BUILD_CC_ARCH`::
>>> +
>>> +         BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
>>> +
>>
>> This seems very gcc-specific but I cannot see the same thing for clang,
>> so I guess it's fine?
> 
> I will mention that this is the default value. Indeed if you were to use clang,
> the definition would be different from this one. I think there will be
> evolutions on that in the future, because the toolchain/ directory was made
> to prepare the ground for supporting clang (I think).
> 

This is actually not the default. It's set by the gcc toolchain, which I 
assume is the default (and only?) toolchain.

I assume we want to state that you should not modify this variable, 
except if you are adding support for a new toolchain, but you can use it 
wherever the CC (for native recipes) or HOSTCC (for target recipes) 
variables are expected to be set?

Cheers,
Quentin

