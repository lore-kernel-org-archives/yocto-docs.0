Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF9DCFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 15:21:48 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19133.1763997702108686881
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Nov 2025 07:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=NM/T0CE0;
 spf=pass (domain: cherry.de, ip: 40.107.159.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HraIxHtc8bvLgtyuycRLImfvyP3AZHHWKdeVN7wdI2GaP0wb/m1dXZPol1NqJl02NqukTJorsmfz0j72uBq4huAzswsPxL1/Oc/xhusrvSWyw9L0ADgJ09A8mK6oYf5CC2DdkQAFzvU+aQIaB0bKv0YNkFYchgoNsX7A2oOnY8GNiePLb9RV92Q+PQq39y9Ur2F1MTFydTHC9wkzcgeiDvNF0/TyQIMMDG2EDmrqv1igkLSrVvlX2rRXoKbNPOA9+ozl2cUk87OtiMHXG3Jg8hgeK6O79XMRcZ4689d/cEyoAIUrYg539ab9a1MBSznq5/hxDQbMRLi1IFmswDQoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FUfFRM9Zhdc2bUQMJnWzcr8Skq4Pz4HJ1AfOE6ghzM=;
 b=I14YK6hu8ckhEQbLHf3hIRsdfTii++yG1N25YABKwWsmKV9OQA7Sg4jvhVKp6LXeiPsQk6FQ8oejgV7v4h8Cc2BAycv/M5S7cqafCoC+OVyiBV72Zy+M17skwP13gfvXbLpIU/GMX9bdGGJOAkrHNeYHvRT96nVQryZlexs6b8epH9uBTXJdfizG4jI50I1y7F7WHRZL8wuofCXICwQJBtVIpk5KGKwEbNbzjmtOxxEcuRCD/LjiQbx9vpZFWTT8Rq1DYJWaL/YV2VC+WT0TrsLDEinKZyu2cbEulCtsCg+Jg8NSUNMxHWVaLbGJFghWUZoAOYLhzB78DXS9yxwcZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FUfFRM9Zhdc2bUQMJnWzcr8Skq4Pz4HJ1AfOE6ghzM=;
 b=NM/T0CE0Hm412HC+HZ7AGqauVcqoT0zgfNyCsycY5gNGr7GsVslUKLCpBrjcUCnEicvmwJnUZtfrVIdCLeeO1o+65soBNDC4cAEF/ugWH/v4HvYHT+/vCyA/jUjfaQRF6YS21Fg+DuF7lDrOn8FOjWXz/BTtG33TGtwnhsEOqrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 15:21:37 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 15:21:36 +0000
Message-ID: <74030727-ae53-4664-8693-34ecb975e557@cherry.de>
Date: Mon, 24 Nov 2025 16:21:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2] brief-yoctoprojectqs: shorten and clarify
 required host packages
To: antonin.godard@bootlin.com, "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <77d4de56-c700-9ae8-f03f-ede89df13e62@crashcourse.ca>
 <DEH0FJ96MF58.TDE0QZF0AM5A@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DEH0FJ96MF58.TDE0QZF0AM5A@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AM7PR04MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 91833963-0496-4930-7936-08de2b6d2893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YzhSMW9kVGx0WkJ4bllPT2kxS0NoV3d4SFNLcUlSSmh5ZlVlT1JkSURSbnY4?=
 =?utf-8?B?T1d6ODJWUHQrVVl5VFUxNFRwOTRPRzdwRVZ4UUxZOURhdm1yY21wN3U5Y24w?=
 =?utf-8?B?Yjl0eXpUeE9veksyN2FOYWpEMmVnd0x3L0pOb1Bva2ZxczdhNDh1QlVBaGhq?=
 =?utf-8?B?eXFLQmRNVytFRE1KZVVvdlZna0JGajdKaGFibWNQUFlFM1JPZ2Ura2JkMWlX?=
 =?utf-8?B?VFRGNEtySEFrSzFvZFZGeUtPa0xhVFFNT252dGRLbHR4K21GZ3ZRbHFuVTJn?=
 =?utf-8?B?K1VqaUorTExRakpLWG9DRmVMdWpzZDdMM09MbTdWUjNYMFlxOFZwd2JqaGJV?=
 =?utf-8?B?VE93OUNKMEtRZkZWWjI0cWRDbjVBa3FFWXdqYWlmZlcrS3d6eXZwckpLdU1l?=
 =?utf-8?B?SDM4QWR1aDV6c1J0MmkxU0VsSVQwWHpDYjl1M3l2ejFRVHJMR2dyUHNIODNo?=
 =?utf-8?B?bm5NTkMreHNuaFkwS205NlNweHJkbmdtNXpSZTd0TDc1cHFINkI5MHFXaksr?=
 =?utf-8?B?a05uMGZHWnVKVUhFc1d5eVo3NlRFZTRwTkphWjZCNnZLZGpiQWtxNU53am1y?=
 =?utf-8?B?SURDVHlpRHVsZmVzZjg1UENrWVdNb3B2SURJRjdGRDRvRURaRDJKV0w2RWIw?=
 =?utf-8?B?KzNCcmRLdlF3M2RaTXlkMXB0MS9pRGJjT3VzM04vWUpaTFdLYUNBMzN2eitk?=
 =?utf-8?B?YzhIRWdGMDFZeWwzYlVGV2JieUI1czc3MjdvbktqYmNheG1FcHNPS0RxMWNO?=
 =?utf-8?B?dlNhYjF6UHRad2NmbThjMVBBREJZNzI2aDJBbXFybEg2SmN5Ymh1VW9tSERY?=
 =?utf-8?B?cEhaemZyNWRMTlNyNnFYUDgveXJpMWtibnduSHBxbGd5bGpkaFhTVmprU0FS?=
 =?utf-8?B?cmZGd1B6VnkzVFhLYVRudDgzNXRKTUczaUpuQW1hSmtQVzRCUWdqQm12TUN6?=
 =?utf-8?B?STFOOE9pT3NYWDJ0a3BUTExmd1lPZ3ZCaHBhU3NLYU81RGpxNmlMbU9HQ2xi?=
 =?utf-8?B?UGxaVjNnb0RuaHdwODQ1VlJQbzBuN3psTS9JTithUUJOOVhOM2JhWktNalVn?=
 =?utf-8?B?N3hLL3picmVRVWZJQ0I4V1BmUy9aQVg0UjRGREhSVlZlTTlHSFo5TC9HMzB1?=
 =?utf-8?B?NEt0R2FyZHQ3S000R1VYbXloQlZyelRzVDR4Y2l4elZkdTYvODZzYk5mSlNF?=
 =?utf-8?B?akxwaTY0V0h0Z3oyYi9Qak5kT2E0cU9mK1h3YVFEempoVHhjaFJtWnIyQ2pX?=
 =?utf-8?B?Y2diU2FFdmxvdHF6Tk95TWQ0b3hYM1F5UUR0UjlrOVVXMTJnU3huWGd1SHNS?=
 =?utf-8?B?VHdCVFdxVjJsTEd0aWZScmlkVjAyN1R3WFVBRERkQ29kWC8rVFlvb1h5ZERu?=
 =?utf-8?B?NllOZk82TGhPVUlhQUYvMG9oOHFGOFptRWp1SEQzcFd5eG9rdGZQUnFyVGZI?=
 =?utf-8?B?ZjRURU1hOGVVZngrZzRWNU1VbHM4aGFJWnN3QUJKRWxCTUt6VU5NN0xCcDIw?=
 =?utf-8?B?Z2plSUhGR0tzUC80V3hhV1BnN1FNY1R5QisrUzlmbDRnVituT3RlVlYvTGN3?=
 =?utf-8?B?eVo5L2MvVE9BUTQwVGhLVElOemtGZS9uR3BmNCsyVXFERm1aSXlNeW9tdCtW?=
 =?utf-8?B?YThybW0zSDYwV3d5bS9pa1dnVDJwMUZuYUc1TDV6V2IwQjA4NlZNSnhVdlZM?=
 =?utf-8?B?QkZhZm53YU1aYy90NjRzOUJ6Y2xGZWtlb3hrc2VEYUd3ZnFGUkt2MzJ0QVJ1?=
 =?utf-8?B?Q0IyVVNnaTVNYmFuVktZK1JDYjQyK3Z4Z0dEa1dkdFhIL2Z4WFFMRDgralJ6?=
 =?utf-8?B?R1VwOGNldmQvZmN6SVduYzVaYVNtZTNrdENIdlZSU2VwZzc1MjZuQlEzeTFt?=
 =?utf-8?B?emJSdUNHUHM1NVZnWFF4MXpDeldVV0NBdFZTSEF1ai9BN2NXNUFwUlQ2K0Ev?=
 =?utf-8?Q?TollIc5mh00oF3KM+wbv/jRiZjrpTIBz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OUNCZm0zelpUNkpHMkR0eUFtK1lWVnFvWmo5WE95REkrM3ZHdU9lS3ptdUpa?=
 =?utf-8?B?a3hEM01aWWErZXNkd1AwYnNIRG91YkEwOTRPZkl4WXFYTkxZdGwxbXlYdnl0?=
 =?utf-8?B?dVRBMlFlQ3FBLzE5TlF3WTZYQTR4a0ZUdXdRalF5TjkrSFlXTWp6Z1hZR3VH?=
 =?utf-8?B?UG9RaWpRZkh2VFpiVGJXdlpsekVKSU9BeTlrNC9HMDNtYnhLS0xLODRVZUF4?=
 =?utf-8?B?eEdlcFpscnozOTlYK1RzRlVweDRaM2owby9qaWpqN3pDNjZoRHNBVUZQOGFP?=
 =?utf-8?B?TzhaanlUeWE3UHNyZVUycmRBdWs4WmtYSk0waU9oZmZPVFNqcSsyVTlob0RL?=
 =?utf-8?B?ZmRPQ3VCd3g3ci9SNUwwOW9Ta2YyNW83NlBnQXJtRFJqeGhZK2VkU2gwZllO?=
 =?utf-8?B?SFpVejFSQWcwT2RZTURiSWdoTWVQTVpoNHdkYXZnSnVjcVkwMUduTzMxODhy?=
 =?utf-8?B?bEVwWFpOTllyZXNQakRsWWdtZnhnUEFPYjFZNm5YVXZySGRZdVVOTStkdnpV?=
 =?utf-8?B?b00ycUJmRnVZV0xnWDhFZVVFVDNjSmlpam9BOHBmMnNvdFBIVjFCb24rdng2?=
 =?utf-8?B?bjNPYkgwaWxUcEZBZG5BUktqcnRsWFpkckdwc1JjbkJmcVdtSGxEQ1pNZ0dx?=
 =?utf-8?B?UnlKTG9lRHJHSXVyWGhmWW9Ma1BDQUxkd2FOKzl0NWw1QTNjY29hdlFHVFFP?=
 =?utf-8?B?aUltR0lPTGRmZGFvRHljTUswZW5nT0s4Y0FuQTlDMzZzeHNVZjNWb1NnZXRz?=
 =?utf-8?B?YXVlRkU0NjRYZzdKNXQ0aWlmQ0EyRzJEMHV6d3h4T01hMkpZa0JHQ3VDYis5?=
 =?utf-8?B?ZlVCK2pOMFNaL0lEaExFeFQ0MVdWOVdVaE84MXFYeWlQcWNyQTRVbno2UmN5?=
 =?utf-8?B?Y1I5K3hWcTRXajdYSDRtVUVQUU5VVUZCdlBaVzdTekc2TEJWOTdRUnpYNGl2?=
 =?utf-8?B?NnNLOVYrRUR5M0ZiQ3NqbERDeE51ZjNWUlV3MUlsSVJMQnowNDZTQ1d6UWhY?=
 =?utf-8?B?dkkwOVUxZUppMXdNU0JHVWZzWllGV3luNmp6UkZTalNFTnlHMWRQQjVwanoy?=
 =?utf-8?B?UEFNeHZLVGR3TDJtRWcweG1KSk9Nb25FRXFHWmRVb3BDVlhBcTZlV3NITkJq?=
 =?utf-8?B?ZkpsWEovZStna24xM0swOHBKTjZERnIzZCszZDFTSjNSeGZoWlJQOTd6RzBS?=
 =?utf-8?B?L0ZnZkNod0MwWlAwdkp6SHdmUWdqazEvMFRxZWxhZzU5VzVEUm1NRm4xS2Yr?=
 =?utf-8?B?SVdCdjRkZmd4eFZhc2hYcGIrR1dOdjE0bHE3N0l3MGhRRDJWb0o1OUQ4TzE4?=
 =?utf-8?B?NnkvbjNYa1NtajFXaVNjYXJmMFVCTTJFZG81YVB2dXkxVHgzMkZMTGExQSsx?=
 =?utf-8?B?UDRHYzBKM2J2TE9WdG51YTVsTnJ3R0tQWWcwWW5ZQW4wVmF5K1RSZko4VWhq?=
 =?utf-8?B?VWRmYm4wWFhjTVdDODhTM01OSTAycjBFc2lldmI2Q1FJaUxPdXNFSlh3NmpB?=
 =?utf-8?B?M2ZCOE5Ramx3RnNCcGNpakJrMGx2TFpMRnpRR1VROFF1RkNsRURUc3BQZXV3?=
 =?utf-8?B?a1NvS2h0OFpEU0NTYXMxdVAvSkNtdEEzQjRjSncxV2FsK2xPSCttSjJHdTI2?=
 =?utf-8?B?OENPaWtPNHdIWGk5cERhbjQrWVBHeERRWDQxTjZkWlQwZVF3QWlFZ05nY2gz?=
 =?utf-8?B?Tmk4YWlnQ0pWbGhueFBrenBlR092eFZNS2xWbDIwTnlXaEp1bjlYK0RxN0Ro?=
 =?utf-8?B?a1Q1MXB2ZklyWGNGZWVzRUsvZDMzRW5uRzZJN1ZBN2FiQk5DQjVudTVrOVcz?=
 =?utf-8?B?YjR3bkZVTkNicGY5UGcwYk5tZklIOXRmUjE0anVQT3J5dUdhdGxCTHBtVGsw?=
 =?utf-8?B?dVdyc3VhdUVvcGdMV280S0oweEFZRVBjOHZDR1N3MVJFQ2pMaWRUTjU2REJX?=
 =?utf-8?B?RTZ6a3lCenVaU2NGNitQN3RNdko2c29LVnVQWjdZa3lNZi9tODIwYWhFQVIr?=
 =?utf-8?B?RVFyOXBBckZRVHJZc2JVV3FSRWVYWWprVjdvejdtTVBlYnJEYVdwblBpQ2s3?=
 =?utf-8?B?Qm1IczFGanVCOGt6S28yb3YwWHpBK2R2aW52WnFDaWVxV0RyTHdxMGhjcG5S?=
 =?utf-8?B?dWFxa1d3eTdLMjExNWN1K1dPQU1WLzZtT09WUkZjR0YvZ3NodHlxU1JuNFc3?=
 =?utf-8?Q?4KrMm992Zm/QQvjvredme84=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 91833963-0496-4930-7936-08de2b6d2893
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 15:21:36.6347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcbupeOwpDkcygBvGeLH/2zwRCrDWabeKgSP4CghukUikx8KMkSs5U9Y1k0nMZ/S5XAaHj0DOsWKN2AQH8yKVkDn+F53TI88oKzr2bPj4Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Nov 2025 15:21:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8107

Hi Antonin,

On 11/24/25 3:55 PM, Antonin Godard via lists.yoctoproject.org wrote:
> Hi,
> 
> On Wed Nov 19, 2025 at 5:55 PM CET, Robert P. J. Day wrote:
> [...]
>> -Build Host Packages
>> -===================
>> -
>> -You must install essential host packages on your build host. The
>> -following command installs the host packages based on an Ubuntu
>> -distribution:
>> -
>> -.. literalinclude:: ../tools/host_packages_scripts/ubuntu_essential.sh
>> -   :language: shell
>> -
>> -.. note::
>> +Supported Linux Distributions and Required Host Packages
>> +========================================================
>>
>> -   For host package requirements on all supported Linux distributions,
>> -   see the :ref:`ref-manual/system-requirements:required packages for the build host`
>> -   section in the Yocto Project Reference Manual.
>> +For host package requirements on all supported Linux distributions,
>> +see the :ref:`ref-manual/system-requirements:required packages for the build host`
>> +section in the Yocto Project Reference Manual.
> 
> I think this defeats the purpose of this guide being the "Quick Start Guide". I
> _think_ most people run Ubuntu when they run Linux, and I believe this is the
> reason why this was written like so in this section.
> 

I have no data on this, so /me shrugs.

> So for the majority of people reading this section will be enough, and that's

The issue is it's not everything that needs to be done according to our 
documentation. So it's already outdated and not well maintained. If you 
want to keep having it this way (which is fair, avoiding to go back and 
forth between the docs when one is reading "quick start" is a good 
idea), I believe we can simply have an .rst with only Ubuntu 
instructions that we can include in both 
ref-manual/system-requirements.rst and brief-yoctoprojectqs/index.rst so 
that it never is outdated?

> the point. Also, the previous section "Compatible Linux Distribution" does
> mention that not all version are supported. So I think this section is fine as

Not all doesn't specify which ones. "Recent" is relative to time and I 
will not be able to build Dunfell on a Ubuntu 25.10 even though that is 
a recent distro and the docs said to use that. I would like to have this 
"recent" removed or reworded. Something like

:ref:`supported version of Ubuntu 
distribution</ref-manual/system-requirements:supported linux distributions>`

Cheers,
Quentin

