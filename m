Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F3DC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 17:11:36 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.48])
 by mx.groups.io with SMTP id smtpd.web09.1172.1647882684153057461
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Mar 2022 10:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Qr0agiyz;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.48,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsesC1wqkv+XJXBHgLaqvrUB3idzxJvs8kZI3XyJuS/ADaH8A7ydEbOCNr41jEfr/tYHSGbj6mWVaI69gntntsgQKbBsR/ic0ejCXMChdNw3/kqvArvQJ0RwcilrhlgdnarCaRQEOO3smBM5lyvRpQV2R+g0bTGWzADYksyt4bGPJKv7Sv8s8JI8j+us+BebepqUDKp8jFw0ES2buCHZDAfqN6hNlF/8lDJzY4ydw2bDlNPoXMxunu6Xv+7xAF8U2m93EDwn+2of90b3GnUTD9Rc8CibOksYgI3S0GoC9UHpQzZoD9L+bx9Qi5TTSVisCVSN8TdwYOLTUoMVyh1enQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdC/3bzs+J7dNH3CieUb+m4PsfOyPq9pn2agFYshveo=;
 b=Aq8WHdzz1mwAxao+0sjrEtqd7Jro+2jC1JuO6StkmeIPutxRVRJpivSEy5+JMZEkhi7mc3fQJ0SPAU/SMvANuW0H33GoAsE9nP7Ia0Ala/JZFaOkkwJm2frwSfYEj9KvUqu5XfP0WKJH9ujdTT3uYAatexa1fEoCp0LJObLuxdyF1UXuFR+TXH972gZhUt3J7/WMnRroRBKjpWIwfJA5Do8Hj3RKOoDZ1G9qcyL09AE0WXCq0IFNyh5MR6QK3dSCedPhtARt8TMsyaaL2Rk35+zua9ejqWq5X8DP3HDfboa2SAUgFhinsUCOMr80gN1c4U05SFrcwF1Bq3tB2VfoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdC/3bzs+J7dNH3CieUb+m4PsfOyPq9pn2agFYshveo=;
 b=Qr0agiyzNT7nt+MQF1dozMMUVN5OwJAcMFLynbg6uhKkeNL57N4ISkrDTqxJUaFdJXGcjzZt+olXgqItUJzpTXvguANRh33QY1Ekxp3wcZ5mYXLmPXCBueqxRo4LIXeZs6kR+pu6VXFcTzxJY47gQ6Ow0z2tkplNWB0eRp0e5SU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB8PR04MB7068.eurprd04.prod.outlook.com (2603:10a6:10:fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 17:11:20 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::1d2b:fd77:d076:a391%7]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 17:11:20 +0000
Message-ID: <300671dc-db7a-1005-e84b-7987dd050294@theobroma-systems.com>
Date: Mon, 21 Mar 2022 18:11:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [docs] [PATCH 2/2] set_versions: Handle older non-active releases
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 docs@lists.yoctoproject.org
References: <20220318162945.1072835-1-richard.purdie@linuxfoundation.org>
 <20220318162945.1072835-2-richard.purdie@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220318162945.1072835-2-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0019.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::23) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b40579b6-e1b7-4879-82ba-08da0b5dd168
X-MS-TrafficTypeDiagnostic: DB8PR04MB7068:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR04MB70682D1385F4E3888806DA84C2169@DB8PR04MB7068.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HjMN8gRvDO7ebGp65ObL7Oq/MI+TF2qWXJgPYgH6JNfcdqCQTOtokGeKPWJ8CZeXdkhYdVandWLTxN3vO2q3UQU0LwENvPgVNo8SoKhmK0/PcnyxazyZbhhXBIKi2X5FZMr0YpNeL8OymBnTeoXmxm+ytWFa2z10FKhDxot/GzJm0xnpr/Hjbo4u6tJ+glTTnxZ0Y/Dl9KXfjO+it/TWdknfMgRb3hVQ9uwiFsbOMOdDyXqfTfqBFQr+M/bBPGMqOpPzIrqj/lFC9q1LFBMpQofjeuY0eR5OAwnEh0+Fy5zN/5k0UFTMaLsnWQFGXz8AYldnn5QK2x7DROOSuS+4Vj912KJtnKpBs5gQ8Dan6b5GnOZMVgV0dh2lLSoAIuCAdt0j+1ZLS3rVccoBRGnohRZg+GZgsOMhJf19JSSbg7tBs9lV30Som0VSAvgBdgQUGGEk+gZzX5Z6XTVNzMNnIrHmJvsnXvwcITSXg37SgREliKmHqYcN0lJWaHFOhv8hzG1sIQCrBh7G4B3PMeDb4JkREaFFdoz6nIgXz0iSgCj1U7jDdVDKYcEQYwVIpj9ncPhmvTvVhayaeRW0yDHTSBLwS9NPfEs9QSMzNGbRWalG/+JhHYxuvxVd7SJ3JpGBlCmiQcFpj2B1OXkhfRqmbjL4LjfPSCV3eF8haXjkErpi2zHt29IOduJimJ/R0zIEcK0UmFLZrRRECClXtu8yxyvF/wpwKcQshTQvscrE4uddfNro+V1pxeMhzg9B1YeR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(8936002)(31686004)(508600001)(316002)(5660300002)(6506007)(38100700002)(31696002)(86362001)(4744005)(53546011)(44832011)(66556008)(66476007)(6486002)(8676002)(66946007)(26005)(6512007)(186003)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z2ZCOGZrUFk1cWV2d1FTUWZDeGNiOFJsUDZBR1c5TTBxWlByNjZQdjRDazI4?=
 =?utf-8?B?REx3cUZvMWF6UnQwSVdqN1A5QmtWU3c4NDg5UVdPZmxlMy8vRWpnSXVjZjB3?=
 =?utf-8?B?V2tKUW42VFB1MWczZjlhaEJZdk9sS01lNVB4T1lwSDQwMTR0TFNTaDNIRDcv?=
 =?utf-8?B?bHEyMmVvNnNtdjRyUFpzWFVXU0YxQ3lGQTgwMFh0UjJCeS9vdlpvalpwVTFU?=
 =?utf-8?B?bUJ4UzRLV0VFalBQMFZUMFEwZFExeDJ3LzR1Kzl1NldPSGtOd3NlQVU3bFdY?=
 =?utf-8?B?b3pHK0tiOHhDNlV6MUttYnNxU2p1Zmd2NCtyTFUwM2Q3QkFjclRkSzBPWnZJ?=
 =?utf-8?B?YzRvMzY1cUhMUmp6dkFYUThWdFUzWUc0enMrMHptTlU5RktnTWNHeEJRYmxB?=
 =?utf-8?B?NzluMGNSVEQ1S05ZUnYycXYxYUd5MFZoT0R4bFNLMXN4ZHR0aWhtZGMwQTZ2?=
 =?utf-8?B?b0pzcTV3ZGt3ZWdROEhLUTV1RS9hbEl0UGZhcjZCaTJHNUdvMi82a0xsT1Bw?=
 =?utf-8?B?MHpzWjh5ZzUycTdsRTlFV1dhQ2hwRFRvU2ZPS0VycXIvTTh4cmdLdmJIaEVi?=
 =?utf-8?B?U2NncXFCSGdTc0lKbWFKdnRLcU1rNGxEc1NOZjBrZjdyQjUzcmF2WWg4N1Z2?=
 =?utf-8?B?RHozSDhuT3FkUW42RUI2blA3WmRkV0ZLR1BXV3F6cTR6YlVhOFFOQ3dLTDJt?=
 =?utf-8?B?a1FQeGtVUEZia2lyMmdHcnBwdElmcmRTZEdRUEVjUEhuN1VyMTYwbmNnaStN?=
 =?utf-8?B?TmNDOXNtWTRFVmZjM2FPMGNqWVdCY0NaVUVkMEZhbTRWL1JVSVUzWnNNREMz?=
 =?utf-8?B?VUZBeGg0dlFROWh1SVROK0I5L0s1T0lkdmJmMEl0aHJPRXYwVE9rNjBURTlr?=
 =?utf-8?B?Ym4zSFZJcGZiWmZvUVRaMGd6VjlmTzUzSlR4WlZKbFBtQ0o4Qk5VWXcyRldm?=
 =?utf-8?B?bmtvWnJJM1czY3dkNWJBd2F4WGVaci9weTdvck9lTjl1UzJWRm0zVzE4eWQ1?=
 =?utf-8?B?M2hOc2ZIK3dFZ3F2V09CWWJCQkp1VFJxMndudktHeE1EeTVuRkNKWmQ5Sis1?=
 =?utf-8?B?R1lJS0YzcThVL1VqQjRSZERFTDE0RFp0RWx6NU5YMFBQbDdXc0dRODl5b3cy?=
 =?utf-8?B?MlM4WktrYitXcG9HUGxzdHA5eXBFZjh4S0x2MFpVbFhvMVdvY29hZFd2Y2or?=
 =?utf-8?B?cmpZUmtWSTNjaDlyazRsU1E2TXFXTWhRZzMxRVdpTnJGQlRyQ3Z2ZDhqZzMw?=
 =?utf-8?B?MHEvMy9XMUVWcWtMUlNOTXZiSVNxWDBCMUlqR01LR2locjJRZDRDTXRBTis2?=
 =?utf-8?B?M0c4MnZua3hZd2dERFh0ZGRNcGlrNExMMzh1M2EvMDliOWFTamgzTGF6d0VB?=
 =?utf-8?B?d0o4d3JNaS9iUkZNS3BGODdvS0FIc1UwQ2Z2U0tSbzZ3NUh4TE1mdCtQYTJt?=
 =?utf-8?B?VWc4UkRHb3pLSC9lT3NuZHYyQ1psL25HOE9TclFTUXJBS2VvbDhPbldHN0Jx?=
 =?utf-8?B?clQ3MjlBSEFMS2dmVE5Idlo3MW5Iek1lOFNmK1JuWUpGdmVrTVdJenJDT1Bn?=
 =?utf-8?B?MWU3Y01UdFh5ZWxnMFExdDRJaUo0SVhEZHdNM0t1eVFuVkg4bGE0T0cxMnB6?=
 =?utf-8?B?WlQzYzRDYzE1ckRDM3RtMWppSUxpaTlZS0J3YWxJclZlNzZveXhsSWpMZXN2?=
 =?utf-8?B?UzFBOGVEZWk3M2xJWVV6VHFRUVptTVBTY0VXeFRLM1krcytRWkQ2TVdIcTk3?=
 =?utf-8?B?azRKVWVlZTBlQnQ0dUtRQm5xRFZqN3UzQ2I5K1JYQUJhV2ZLdUI4OVJlNktm?=
 =?utf-8?B?dG1TWTlNYmp2bGlRS0I3cEhiTXkyakRtTDUvMitCSlo4TFNkc3dNeFlGYkhq?=
 =?utf-8?B?OWorU0tmUG5HQkpLSTVpbjFJOWJ4RHFYUDU2d1NBaG0wdXNoKzJZWmNWalU2?=
 =?utf-8?B?U2FTZ1lIQWxJMGdweW95WDBuV01scytVaXRrZ3h6M3lrZitjQ0Y3bFJCNVVm?=
 =?utf-8?Q?DngSRNc7BGfRfECEMPsIo5UvB2AW8Q=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b40579b6-e1b7-4879-82ba-08da0b5dd168
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 17:11:20.3872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m42UI6wVeqFPqXQPAgFwgg4uX78MA71sDch1ZDhA0B54G5GA1s8hadWGgaqiPplCPih1+bgYtD3eod/h3g0DRl6F6ZEiGhayxH6XMS/qp5W4sSNtgRF7VeqipUkMRL3a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7068
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Mar 2022 17:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2657

Hi Richard,

On 3/18/22 17:29, Richard Purdie wrote:
> Ensure older non-active releases are shown in the switchers.js
> release list.
> 

We're currently showing EOL releases in the docs too. I think we need to 
discuss this first before removing EOL releases in the previous patch 
(pretty sure I commented on another patchseries questioning this 
decision). I don't think it's a good idea to mask them but I'm happy to 
be proven otherwise :)

Cheers,
Quentin

