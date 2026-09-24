Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F38C9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 12:19:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6529.1790252344677062452
 for <docs@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 05:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=wyeShivs;
 spf=pass (domain: siemens.com, ip: 40.107.130.41, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTm7J4g9jKYtNbyFqjKSHZ3QTnUVVXx4ouDP8A7GHub4PfOYGv/vodW96jLDb7vK1A2SmV6K6krbb735rBi/TnXYFpGcnGXP8B8mHBHHJfN7rCyT70aDJU4hRwfQou54tW0nSN92h7zNWLOAC2TU5ryVDkbo2zzVhypzlqCdrztVGYwPkrbim8AOWOubw+awrU3V8ttwJlOU1onX/EIsFjsex+LPnAw6h3S6uzAAGOBJhihYimOYiByxjE2TwEZyufgmaFTa8NHPol+0b7yOg0WyEfRtsJYdcokPAvckbDeVAfSB0bxAZi+W1rYELJ3P/fbmrSYtzpTNHaN8kV6SBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DJkOQsBtY/5TGZbqDZ3dR4UEs7k7CtvmtmXjSqjNtk=;
 b=YeWsOj15IaQxOiAuhtcKpD4RnwhKRM137LRFsMlppenKXLhZOJBvhB1InAjjvhQeRov4QtxZAQahtJj9HKDsBHF+ePLO2jgvTRuPxrpSaymd1FdI3CdeOPT4/1if0jcBkQdHN8HukILKRT80H0Wv30v1G6ki4VdFVJXLEMcYiaCGDWy75FQwQGlDYCjDNSchnfm0pFsoXBCX/wB6IEhJv0Id+rlD3uTR2RBxpG8Z+DQHecNYzCVgDxmn7squYcryKI0LPB+pnFnOokQwtn/9XwIIKN1QUIQFgW2l8FHMqZQSfol7RC2A4iy5PxefoeJzVjk2nZ24WkZWRqqLpO0c/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DJkOQsBtY/5TGZbqDZ3dR4UEs7k7CtvmtmXjSqjNtk=;
 b=wyeShivs+xLfPUGfiRA0G+jy/Mi0BfoxrVRLrRrbNZa1LMP1C6Xx0gThmuYE4vs0/AfOz/XP+SkP/4DCGCVekfB2qB+lYtf8B1HzpcYs6XhdaUp7MWO/WGMzEYFzoJeE+kyEjTw1ayrmsSrIToFcLV20gZ2XbcJeE6QZ24EbfZ7CKwT9XY689c0Pg8Gcl9G445E3sAgpH5ufmMRBO1xuG8sc6QYce2Y8MxIDcGyi5Gd3bujoYGwnAK2x4KjgIGu11tBMRCPGqKZrfHehzZsm9M0MmDryEC2sqNF5RcnbQV3Im63qbVT3X2ShCkCdLqhj+2Nogpo2FFvNTDOQYTKiyQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AS2PR10MB7852.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:642::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 12:19:00 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 12:18:58 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: RE: [docs] [PATCH 2/2] docs-wide: recommend a minimum of 16 CPU cores
Thread-Topic: [docs] [PATCH 2/2] docs-wide: recommend a minimum of 16 CPU
 cores
Thread-Index: AQHdTBq4+ChghEbT+kuF6GBdXQNCv7bdpQ7A
Date: Thu, 24 Sep 2026 12:18:58 +0000
Message-ID: 
 <AS8PR10MB50734E1EB8BBA9F526F9A841FD812@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260924-min-cpu-requirements-v1-0-003fc136e9c4@bootlin.com>
 <20260924-min-cpu-requirements-v1-2-003fc136e9c4@bootlin.com>
In-Reply-To: <20260924-min-cpu-requirements-v1-2-003fc136e9c4@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8f77d75c-b1b9-4cde-8667-4f3b6e9e776c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-24T12:17:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AS2PR10MB7852:EE_
x-ms-office365-filtering-correlation-id: 9b35d1b8-3161-4c44-0155-08df1a3602cf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|4143699003|10067099003|55112099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 mbTNdZ7fL5MyLyNiVB2fQurSYKqCftbaLFxEUx+8M3BNp6KcgB1RtAkfKMNwc21Bsk8SPQPJdVm34riV+k8UOzjluWSyUfjzcNANsSj8KZDmoqMY4TJMBxLUqgyFlZjn4ELf+TrkvISeVGhYm0GPD6B3uYtTWot4lj+K4v6WBfoO0rwXnuEMoVmGnzSFzIRpMDj91ETLViF36cOYz5yAK9Jte7TJ0L0ToWs1/dmdAXvLsmaQzKGp4hyY9nKz+MwDm+z3+NsvhTxzB9v0dsDsDkxc3yM9NlWlV9VZ+S8gpiu7M2WKtjD/C0jkTf8Y+OAGysFoLvVDjkf4iN/JYf4JTsfEuoCqvN3CFQuIRc4FLL1WPZgfwmZCf33aZ5mI6DYERuRZyVqJsgDhuDV0FmxI0x4JysoS9jMEYFN5Oi+1Q47Q6qebXGdJgbZLU48Wv2MlH7X0zm7+pblonpYnZo5gBPJx9z7KKVpK8mt4tMC96lUSv1ZTw4fB3af90zjCXXjJ+nH05BTepqvRyKFlb6E70mD5j/KJsXDV/k19QHpW/laGHeggd/xAkrC/u+td7Fn/dFhCRraLQAtpC8Ow/j/0xaCwcHbcAKOw3+ehR+duZsRm7zSaxWfCga2vsJtUfTRj1PMEQO85Kf8YQhzhmzSeZqjyuZ6JvgCDpAyVc0TsVTYHqo0iAkOqkQzQ0FgKpTA9l3dRwivO3Qpx2ft4iA94m+wLndZpCodvYJC/s7vx/Ow=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(55112099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WTlTeFNjaXRjYmxmMjZLNVB0OU9tdHJZTjdCNzgxQk0zVWdIb2NUUGZjUit2?=
 =?utf-8?B?WUl4TmY2b0JIN1pTWHo2RVBnN2Z0U3VBa1ltazVmT3dhMGJlN1dVbm11ajN4?=
 =?utf-8?B?VmRwY09zVkE0SnRXVkszanlrbDRIWkVOTkIycG5DbkxabmhJWXhreUdxWXFL?=
 =?utf-8?B?MHhpZW5MTUo3d0hFZlM2ZGJGd1Z1ZGNYK3pwbGN6L29jMzR3cmVhQ3I4ejMz?=
 =?utf-8?B?eGc1NU5pVzR3akxjSGFSMDRaRStJRjByZnpIczduU2FCRFluRHZoRWVPNis3?=
 =?utf-8?B?MXJMTHk0UEY1S3R6b011cjNKZjBqUHBPWmNZcHovUEgzekNWSnpITEU4a3ZZ?=
 =?utf-8?B?SGhlZk8reUY0MHdQMVBmZ0R0S2tmUG12Zi9pVTI4T1VIRUoxYTBRdjRScTEx?=
 =?utf-8?B?dGpoMDFnQitWOGJBeWlQQncvYXJmMUtrWE1IK2g2eGx1eHAxdk5lK0dTUktl?=
 =?utf-8?B?alRjQW5uSE5FWXlLL0NTbEF5TnBwazV6QkZQbVFmRk1BL1p6b2ZyZ1Bac2NB?=
 =?utf-8?B?NHJzMit0WHpGNS8wRXp0eXE2TjdaeHdVZFY3dEFYclB5SktRN1FRWmY4MzB2?=
 =?utf-8?B?WjNCUmdRU2pwOFgxQ09UdXpFcTFtdDdTc2Q3ejlaMW9vT1Y3MGZJZVViOTlw?=
 =?utf-8?B?RFVMaW5WL3RZRWVZbk5Ib2FYeDJobXl6ZGtwMjQ1c1JhVmVYaDZKYnZGZCtk?=
 =?utf-8?B?eFc5SFUzWnZ3OTNjVjlzcVN0VUN3Y0FIYjZMQmlXNXBrdUU0REtDSkg1OTNj?=
 =?utf-8?B?eStXQTU0TkkvaFlUMWJ0T3RXb0hDR2pubDRIektRZ1RmVjcrM1g1cDFCOXcw?=
 =?utf-8?B?a3lweWczWTN3MTZHOWdHWC91NjdPNGRwWFhBS2VQTE5BRmJEVnJxejdNVlQ0?=
 =?utf-8?B?TnU0VkRkdjFpY1ZubWcxdUVjbk5OUVZmRG14UzQxbzhQSDVuazI1UkkvOXBj?=
 =?utf-8?B?ZE92ZVRUY0FxdGRZWitBM2RaRC9Yd2J2Qk5JVzJkZStKREM0YUcwUDcrV05G?=
 =?utf-8?B?a2VWeFByWnk4aVNYdTI4cEY3Y043QmVOZm9pY1FFV2dYdWYxQUF6UUxNZVdS?=
 =?utf-8?B?SklvUEo3UlJFSGJuKzRLUm50UWd0endocGpqWDU0dit5d1N0bnQ2RDc2a2h4?=
 =?utf-8?B?bVdOdU9sbWFkREp1bEVvajZkMlBYNnRXNFo2RHhINGg2M283dE1mSWVYUkdR?=
 =?utf-8?B?cUxLb0ltaEgyeHRJMHFWNXhURUY2ck4rSVBrOWNBMEp0d3pycytXaVlscFla?=
 =?utf-8?B?MFZUNFNjOWRxdDI5T2tGS3F5QXFOZ3FVd01XcENNd0VDem9lNXhBQ1VFeC9F?=
 =?utf-8?B?R29maWZRT1JJckw1b2lGVDZEd0V3U0FmeG1yV0hKRnZXS1RqcmhTSGxReEpo?=
 =?utf-8?B?d0dETnFPVUk1NlZhdDc5cjdxWlFxcTBUNjFTZXBmTjRtTnQwYWRoSzJ1RGtX?=
 =?utf-8?B?V2RxSTBUb0JLUC9FMzRiZUlSRTY5WXM1UVJKV0dxQjUzU01IbFo3cjFvUlBj?=
 =?utf-8?B?bkhRT25ESGk1eVV6cSsybE9rbWZGaWkwd0daOEtwbWlFSDJ5OS9RdUtHU1NF?=
 =?utf-8?B?bzNWc2RRaXQxWDhEL1IvKzRPUTUzdHNIRHpMQlpkbXRLbUR4cExWd1Bld2hF?=
 =?utf-8?B?YlByMHJvREI1dkt1RXQySy9mbm1PT2JuQkxBL3lQbGtVZ0Z4RWJFSEhvekpC?=
 =?utf-8?B?UnFwU3YvdTZzMDNkeGJ2WGdtSW95My9wdXRwT3dUcjhiZEdzaUI0Tjd2SmpQ?=
 =?utf-8?B?Ky9iOVJWM3hKajhmdTRlNzZ5UjloSW82ME10bnJ1a29YdDEydVlIZlhpVEtk?=
 =?utf-8?B?eG80WlhhVlRSb20rN0ZxZkhRTHhSTmFPMGFSdkFwQnhtcHowaVJWWlF3YkU4?=
 =?utf-8?B?V0RsSnRET0Y0NEFVaDJpWTcvcHg5eW9mdC9KSVh1eGkxL3FoME91ZWJSQkRH?=
 =?utf-8?B?NVQ3SWJjQmJjaS80R0ZmNHUwT0dEQjRyZEtOZ3RwUW1VbnZYaktBd0VaRTdj?=
 =?utf-8?B?NWpqRHJMVU1DYU02c2ZHQWphUGVYTkNzOHpqREVjbjZDN3VjQ1BxRmRNVEM1?=
 =?utf-8?B?TTE3d1krKzdWa3N1UmFOV3YydEFWN29TdWtiMlpTb3JldEVLUXpWaFBaUzZI?=
 =?utf-8?B?S1R5TzF6VDFHaEE3RS9MbG5Ub0JGS2VidGVVa0lxZlFiRUxiNTZDd002S01L?=
 =?utf-8?B?S3I1RHJieEJYdFJ0b3VteXpzVUdRUEU1amoyMTkyQzJPZEhJSlYyUjRxTmtr?=
 =?utf-8?B?aWtyQitobmw4aVFnbUlUR2xJU1YvN3JoYkt1bzFmdGFsTDNBaDMyb1ZleW5z?=
 =?utf-8?B?aUZaeklpMjZXM2ltSGFqSlZyN2hwRzRhbHRiVWpERGpsckhqQ3Jrdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b35d1b8-3161-4c44-0155-08df1a3602cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 12:18:58.7531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lGMwAo8moqQ8juY1CS1spkSfYVXV7TDluIMY8LmqB+PM2PGF6a/sP93tdx6LJQ7Y173s9PtbldcQ7PqH/0Rr1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7852
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 24 Sep 2026 12:19:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10616

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZG9jc0BsaXN0cy55b2N0
b3Byb2plY3Qub3JnIDxkb2NzQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0K
PiBBbnRvbmluIEdvZGFyZCB2aWEgbGlzdHMueW9jdG9wcm9qZWN0Lm9yZw0KPiBTZW50OiBUaHVy
c2RheSwgU2VwdGVtYmVyIDI0LCAyMDI2IDE6NDkgUE0NCj4gVG86IGRvY3NAbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZw0KPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4NCj4gU3ViamVjdDogW2RvY3NdIFtQQVRDSCAyLzJdIGRvY3Mtd2lkZTogcmVjb21t
ZW5kIGEgbWluaW11bSBvZiAxNiBDUFUgY29yZXMNCj4gDQo+IEFkZCB0aGUgTUlOX0NQVV9DT1JF
UyBtYWNybyB0byBwb2t5LnlhbWwuaW4gYW5kIHVzZSBpdCBpbiBwbGFjZXMgd2hlcmUNCj4gd2Ug
bGlzdCBtaW5pbXVtIGhvc3QgcmVxdWlyZW1lbnRzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW50
b25pbiBHb2RhcmQgPGFudG9uaW4uZ29kYXJkQGJvb3RsaW4uY29tPg0KPiAtLS0NCj4gIGRvY3Vt
ZW50YXRpb24vYnJpZWYteW9jdG9wcm9qZWN0cXMvaW5kZXgucnN0ICAgICB8IDYgKysrLS0tDQo+
ICBkb2N1bWVudGF0aW9uL2Rldi1tYW51YWwvc3RhcnQucnN0ICAgICAgICAgICAgICAgfCAzICsr
LQ0KPiAgZG9jdW1lbnRhdGlvbi9wb2t5LnlhbWwuaW4gICAgICAgICAgICAgICAgICAgICAgIHwg
MiArKw0KPiAgZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFsL3N5c3RlbS1yZXF1aXJlbWVudHMucnN0
IHwgOCArKysrLS0tLQ0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RvY3VtZW50YXRpb24vYnJpZWYteW9jdG9w
cm9qZWN0cXMvaW5kZXgucnN0IGIvZG9jdW1lbnRhdGlvbi9icmllZi0NCj4geW9jdG9wcm9qZWN0
cXMvaW5kZXgucnN0DQo+IGluZGV4IGY3ZTQ2MDZmMS4uZGNkZjc4MDNhIDEwMDY0NA0KPiAtLS0g
YS9kb2N1bWVudGF0aW9uL2JyaWVmLXlvY3RvcHJvamVjdHFzL2luZGV4LnJzdA0KPiArKysgYi9k
b2N1bWVudGF0aW9uL2JyaWVmLXlvY3RvcHJvamVjdHFzL2luZGV4LnJzdA0KPiBAQCAtNDMsOSAr
NDMsOSBAQCBmb2xsb3dpbmcgcmVxdWlyZW1lbnRzOg0KPiAgICAgbXVjaCBtb3JlIHdpbGwgaGVs
cCB0byBydW4gbXVsdGlwbGUgYnVpbGRzIGFuZCBpbmNyZWFzZQ0KPiAgICAgcGVyZm9ybWFuY2Ug
YnkgcmV1c2luZyBidWlsZCBhcnRpZmFjdHMuDQo+IA0KPiAtLSAgQXQgbGVhc3QgJk1JTl9SQU07
IEdieXRlcyBvZiBSQU0sIHRob3VnaCBhIG1vZGVybiBidWlsZCBob3N0IHdpdGggYXMNCj4gLSAg
IG11Y2ggUkFNIGFuZCBhcyBtYW55IENQVSBjb3JlcyBhcyBwb3NzaWJsZSBpcyBzdHJvbmdseSBy
ZWNvbW1lbmRlZCB0bw0KPiAtICAgbWF4aW1pemUgYnVpbGQgcGVyZm9ybWFuY2UuDQo+ICstICBB
dCBsZWFzdCAmTUlOX1JBTTsgR2J5dGVzIG9mIFJBTSBhbmQgJk1JTl9DUFVfQ09SRVM7IENQVSBj
b3JlcywNCj4gdGhvdWdoIGENCj4gKyAgIG1vZGVybiBidWlsZCBob3N0IHdpdGggYXMgbXVjaCBS
QU0gYW5kIGFzIG1hbnkgQ1BVIGNvcmVzIGFzIHBvc3NpYmxlIGlzDQo+ICsgICBzdHJvbmdseSBy
ZWNvbW1lbmRlZCB0byBtYXhpbWl6ZSBidWlsZCBwZXJmb3JtYW5jZS4NCj4gDQo+ICAtICBSdW5z
IGEgc3VwcG9ydGVkIExpbnV4IGRpc3RyaWJ1dGlvbiAoaS5lLiByZWNlbnQgcmVsZWFzZXMgb2Yg
RmVkb3JhLA0KPiAgICAgb3BlblNVU0UsIENlbnRPUywgRGViaWFuLCBvciBVYnVudHUpLiBGb3Ig
YSBsaXN0IG9mIExpbnV4DQo+IGRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL2Rldi1tYW51YWwv
c3RhcnQucnN0IGIvZG9jdW1lbnRhdGlvbi9kZXYtDQo+IG1hbnVhbC9zdGFydC5yc3QNCj4gaW5k
ZXggNWYwYmIzN2I3Li44ZmEzMmQ0NzMgMTAwNjQ0DQo+IC0tLSBhL2RvY3VtZW50YXRpb24vZGV2
LW1hbnVhbC9zdGFydC5yc3QNCj4gKysrIGIvZG9jdW1lbnRhdGlvbi9kZXYtbWFudWFsL3N0YXJ0
LnJzdA0KPiBAQCAtNTYsNyArNTYsOCBAQCBwYXJ0aWN1bGFyIHdvcmtpbmcgZW52aXJvbm1lbnQg
YW5kIHNldCBvZiBwcmFjdGljZXMuDQo+ICAgICAgZ2V0IHRoZSBoYXJkd2FyZSB0b2dldGhlci4g
SWRlYWxseSwgYW55IGRldmVsb3BtZW50LCBidWlsZCwgb3IgdGVzdA0KPiAgICAgIGVuZ2luZWVy
IHVzZXMgYSBzeXN0ZW0gdGhhdCBydW5zIGEgc3VwcG9ydGVkIExpbnV4IGRpc3RyaWJ1dGlvbi4N
Cj4gICAgICBUaGVzZSBzeXN0ZW1zLCBpbiBnZW5lcmFsLCBzaG91bGQgYmUgaGlnaCBwZXJmb3Jt
YW5jZSAoZS5nLiBhIG1pbmltdW0NCj4gLSAgICBvZiAmTUlOX1JBTTsgR2J5dGVzIG9mIFJBTSBh
bmQgYXQgbGVhc3QgJk1JTl9ESVNLX1NQQUNFOyBHYnl0ZXMgb2YNCj4gZGlzayBzcGFjZSkuDQo+
ICsgICAgb2YgJk1JTl9SQU07IEdieXRlcyBvZiBSQU0sIGF0IGxlYXN0ICZNSU5fRElTS19TUEFD
RTsgR2J5dGVzIG9mIGRpc2sNCj4gc3BhY2UNCj4gKyAgICBhbmQgYSBtaW5pbXVtIG9mICZNSU5f
Q1BVX0NPUkVTOyBDUFUgY29yZXMpLg0KPiAgICAgIFlvdSBjYW4gaGVscCBlbnN1cmUgZWZmaWNp
ZW5jeSBieSBoYXZpbmcgYW55IG1hY2hpbmVzIHVzZWQgZm9yIHRlc3RpbmcNCj4gICAgICBvciB0
aGF0IHJ1biBBdXRvYnVpbGRlcnMgYmUgYXMgaGlnaCBwZXJmb3JtYW5jZSBhcyBwb3NzaWJsZS4N
Cj4gDQo+IGRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL3Bva3kueWFtbC5pbiBiL2RvY3VtZW50
YXRpb24vcG9reS55YW1sLmluDQo+IGluZGV4IDNlNzRkZDdlNy4uYjdkYWM0ZmYzIDEwMDY0NA0K
PiAtLS0gYS9kb2N1bWVudGF0aW9uL3Bva3kueWFtbC5pbg0KPiArKysgYi9kb2N1bWVudGF0aW9u
L3Bva3kueWFtbC5pbg0KPiBAQCAtNDYsMyArNDYsNSBAQCBNSU5fRElTS19TUEFDRSA6ICIxNDAi
DQo+ICBNSU5fRElTS19TUEFDRV9STV9XT1JLIDogIjQwIg0KPiAgIyBSQU0gKEdieXRlcykgbmVl
ZGVkIHRvIGdlbmVyYXRlIHFlbXV4ODYtNjQgY29yZS1pbWFnZS1zYXRvIG9uIFVidW50dQ0KPiAy
Mi4wNCAoeDg2LTY0KSBvbiBhIDQgY29yZSBzeXN0ZW0NCg0KVGhpcyAiNCBjb3JlIHN5c3RlbSIg
c2hvdWxkIGJlIHVwZGF0ZWQgdG9vIHNpbmNlIG1pbmltdW0gaXMgMTYgbm93Lg0KV2lsbCAzMiBH
QiBiZSBzdWZmaWNpZW50IG9uIDE2IGNvcmVzPyBJIHRoaW5rIGl0IHdpbGwgYmUgcHJvYmxlbWF0
aWMuDQoNCj4gIE1JTl9SQU0gOiAiMzIiDQo+ICsjIFJlY29tbWVuZGVkIG1pbmltdW0gbnVtYmVy
IG9mIENQVSBjb3Jlcw0KPiArTUlOX0NQVV9DT1JFUyA6ICIxNiINCj4gZGlmZiAtLWdpdCBhL2Rv
Y3VtZW50YXRpb24vcmVmLW1hbnVhbC9zeXN0ZW0tcmVxdWlyZW1lbnRzLnJzdA0KPiBiL2RvY3Vt
ZW50YXRpb24vcmVmLW1hbnVhbC9zeXN0ZW0tcmVxdWlyZW1lbnRzLnJzdA0KPiBpbmRleCBkNjAy
ZmEyY2EuLmEwYjkwMmFlYyAxMDA2NDQNCj4gLS0tIGEvZG9jdW1lbnRhdGlvbi9yZWYtbWFudWFs
L3N5c3RlbS1yZXF1aXJlbWVudHMucnN0DQo+ICsrKyBiL2RvY3VtZW50YXRpb24vcmVmLW1hbnVh
bC9zeXN0ZW0tcmVxdWlyZW1lbnRzLnJzdA0KPiBAQCAtNDIsMTIgKzQyLDEyIEBAIHNlY3Rpb24g
b2YgdGhlIERldmVsb3BtZW50IFRhc2tzIE1hbnVhbC4NCj4gDQo+ICAuLiBfc3lzdGVtLXJlcXVp
cmVtZW50cy1taW5pbXVtLXJhbToNCj4gDQo+IC1NaW5pbXVtIFN5c3RlbSBSQU0NCj4gLT09PT09
PT09PT09PT09PT09PQ0KPiArTWluaW11bSBTeXN0ZW0gUkFNIGFuZCBDUFUgQ29yZXMNCj4gKz09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiAgWW91IHdpbGwgbWFuYWdlIHRv
IGJ1aWxkIGFuIGltYWdlIHN1Y2ggYXMgYGBjb3JlLWltYWdlLXNhdG9gYCBmb3IgdGhlDQo+IC1g
YHFlbXV4ODYtNjRgYCBtYWNoaW5lIHdpdGggYXMgbGl0dGxlIGFzICZNSU5fUkFNOyBHYnl0ZXMg
b2YgUkFNIG9uIGFuIG9sZA0KPiAtc3lzdGVtIHdpdGggNCBDUFUgY29yZXMsIGJ1dCB5b3VyIGJ1
aWxkcyB3aWxsIGJlIG11Y2ggZmFzdGVyIG9uIGEgc3lzdGVtIHdpdGgNCj4gK2BgcWVtdXg4Ni02
NGBgIG1hY2hpbmUgd2l0aCBhcyBsaXR0bGUgYXMgJk1JTl9SQU07IEdieXRlcyBvZiBSQU0gYW5k
DQo+ICsmTUlOX0NQVV9DT1JFUzsgQ1BVIGNvcmVzLCBidXQgeW91ciBidWlsZHMgd2lsbCBiZSBt
dWNoIGZhc3RlciBvbiBhDQo+IHN5c3RlbSB3aXRoDQo+ICBhcyBtdWNoIFJBTSBhbmQgYXMgbWFu
eSBDUFUgY29yZXMgYXMgcG9zc2libGUuDQo+IA0KPiAgLi4gX3N5c3RlbS1yZXF1aXJlbWVudHMt
c3VwcG9ydGVkLWRpc3Ryb3M6DQo+IA0KPiAtLQ0KPiAyLjU1LjANCg0K

